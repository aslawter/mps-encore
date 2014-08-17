class WordDocumentWriter
  def initialize(word_document_generator)
    @word_document_generator = word_document_generator
  end

  def write
    File.open(path_to_written_output, "w") {|file| file.write(@word_document_generator)}
  end

  private

  def path_to_written_output
    Rails.root.join("tmp", "sessions", "word_document", "document.xml")
  end
end
