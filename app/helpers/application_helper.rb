module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to 'Log in', new_user_session_path, class: style) +
      (" ".html_safe) +
      (link_to 'Register', new_user_registration_path, class: style)
    else 
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end 
  end

  def login_helper_for_li li_style = '', link_style = ''
    if current_user.is_a?(GuestUser)
      "<li class='#{li_style}'>".html_safe +
      (link_to 'Log in', new_user_session_path, class: link_style) +
      ("</li>".html_safe) +
      "<li class='#{li_style}'>".html_safe +
      (link_to 'Register', new_user_registration_path, class: link_style) +
      ("</li>".html_safe) 
    else 
      link_to 'Logout', destroy_user_session_path, method: :delete, class: link_style
    end 
  end

  def source_helper(layout_name)
  	if session[:source]
      greeting = "Thanks for visiting from #{session[:source]} and you are on the #{layout_name} "
  	  content_tag(:p, greeting, class: "source-greeting")
    end 
  end

  def copyright_generator
    DannugViewTool::Renderer.copyright 'Norman Paul Dannug', 'All rights reserved'
  end
  
  def nav_helper style, tag_type, tag_style = ''
    nav_links = <<~NAV
    <#{tag_type} class="#{tag_style}" >
    <a href="#{root_path}" class="#{style} #{active? root_path}">Home</a>
    </#{tag_type}>
    <#{tag_type} class="#{tag_style}" >
    <a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blogs</a>
    </#{tag_type}>
    <#{tag_type} class="#{tag_style}" >
    <a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolios</a>
    </#{tag_type}>
    <#{tag_type} class="#{tag_style}" >
    <a href="#{about_me_path}" class="#{style} #{active? about_me_path}">About</a>
    </#{tag_type}>
    <#{tag_type} class="#{tag_style}" >
    <a href="#{contact_me_path}" class="#{style} #{active? contact_me_path}">Contact</a>
    </#{tag_type}>
    NAV
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

end
