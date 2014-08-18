class TemplateReader
  def read
    File.read(path_to_word_document)
  end

  private

  def path_to_word_document
    Rails.root.join("lib", "assets", "word_document", "word", "document.xml")
  end
end
