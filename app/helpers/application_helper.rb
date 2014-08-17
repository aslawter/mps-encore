module ApplicationHelper
  def markdown(text)
    render_options = {
      filter_html: true,
      hard_wrap: true,
      no_images: true,
      no_styles: true
    }

    extentions = {
      autolink: true,
      superscript: true,
      underline: true,
      strikethrough: true,
      space_after_headers: true,
      lax_spacing: true
    }

    renderer = Redcarpet::Render::HTML.new(render_options)
    markdown = Redcarpet::Markdown.new(renderer, extentions)
    markdown.render(text).html_safe
  end
end
