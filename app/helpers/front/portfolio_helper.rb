module Front::PortfolioHelper
  def set_project_title project
    link_to(front_portfolio_path(project), class: "front-project-link") do 
      content_tag :h1, project.title
    end 
  end

  def set_project_tags project
    html_res = ''
    project.tags.each do |n| 
      html_res += "#{n.name}, "
    end
    return html_res[0..-3]
  end

  def set_project_caption project
    link_to(front_portfolio_path(project), class: "front-project-link") do
      content_tag :div, project.caption, class: "project-caption"
    end
  end

end
