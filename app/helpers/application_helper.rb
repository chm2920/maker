module ApplicationHelper
  
  def format_content(content)
    # (simple_format content).gsub("<br>", "").gsub("<br />", "").gsub("<br/>", "").html_safe
    content.html_safe
  end
  
end
