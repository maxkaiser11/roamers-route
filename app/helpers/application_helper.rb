module ApplicationHelper
  def markdown(string)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true)
    renderer.render(string).html_safe
  end
end
