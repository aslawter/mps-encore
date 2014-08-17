class TemplateReader
  def read
    File.read(path_to_word_document)
  end

  private

  def path_to_word_document
    Rails.root.join("lib", "assets", "word_document", "word", "document.xml")
  end
end

template_reader = TemplateReader.new
file_template = template_reader.read
performance = Performance.first

word_document_generator = WordDocumentGenerator.new(file_template, performance)
word_document_writer = WordDocumentWriter.new(word_document_generator)
word_document_writer.write

puts word_document_generator.generate
