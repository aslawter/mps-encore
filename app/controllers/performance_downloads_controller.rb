class PerformanceDownloadsController < ApplicationController
  def create
    @performance = Performance.find(params[:performance_id])
    read_in_template
    populate_template
    create_word_document
    send_file(Rails.root.join("tmp", "performance-#{current_user.id}.docx"), filename: "performance-#{@performance.customer.name}.docx")
  end

  private

  def read_in_template
    template_reader = TemplateReader.new
    @file_template = template_reader.read
  end

  def populate_template
    word_document_generator = WordDocumentGenerator.new(@file_template, @performance)
    @content = word_document_generator.generate
  end

  def create_word_document
    word_document_writer = WordDocumentWriter.new(@content, current_user.id)
    word_document_writer.write
    word_document_writer.zip
  end
end
