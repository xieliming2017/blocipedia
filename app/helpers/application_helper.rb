require 'redcarpet'

module ApplicationHelper
  def markdown_text(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(text).html_safe
  end
end
