class DownloadsController < ApplicationController
  def create
    template_reader = TemplateReader.new
    file_template = template_reader.read
    performance = Performance.find(params[:performance_id])

    word_document_generator = WordDocumentGenerator.new(file_template, performance)
    content = word_document_generator.generate
    word_document_writer = WordDocumentWriter.new(content)
    word_document_writer.write
    word_document_writer.zip

    redirect_to performance
  end
end
