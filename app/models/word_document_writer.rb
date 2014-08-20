class WordDocumentWriter
  def initialize(content, id)
    @content = content
    @id = id
  end

  def write
    create_output_directory
    File.open(path_to_generated_xml_document, "w") {|file| file.write(@content)}
  end

  def zip
    zipfile_name = Rails.root.join("tmp/performance-#{@id}.docx")

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      Dir.glob(Rails.root.join("lib/assets/word_document/**/*")).each do |full_path|
        if full_path.ends_with?("document.xml")
          filename = "word/document.xml"
          full_path = path_to_generated_xml_document
        else
          filename = full_path.sub(Rails.root.join("lib/assets/word_document/").to_s, "")
        end

        zipfile.add(filename, full_path)
      end

      path = Rails.root.join("lib/assets/word_document/_rels/.rels")
      path_inside_zipfile = path.sub(Rails.root.join("lib/assets/word_document/").to_s, "")
      zipfile.add(path_inside_zipfile, path)
    end
  end

  private

  def path_to_generated_xml_document
    Rails.root.join("tmp", "word_document", "document.xml")
  end

  def create_output_directory
    FileUtils.mkdir_p(File.dirname(path_to_generated_xml_document))
  end
end
