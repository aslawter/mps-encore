module ApplicationHelper
  MARKDOWN_OPTIONS = {
    filter_html: true,
    hard_wrap: true,
    no_images: true,
    no_styles: true
  }

  MARKDOWN_EXTENSIONS = {
    autolink: true,
    superscript: true,
    underline: true,
    strikethrough: true,
    space_after_headers: true,
    lax_spacing: true
  }

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(MARKDOWN_OPTIONS)
    markdown = Redcarpet::Markdown.new(renderer, MARKDOWN_EXTENSIONS)
    markdown.render(text).html_safe
  end
end
