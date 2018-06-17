module ApplicationHelper
  def icon(classes, title = nil, style = nil)
    content_tag(:i, '', class: "fa #{classes}", title: title, style: style)
  end
end
