module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to 'Login', new_user_session_path, class: style) +
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

  def source_helper(styles)
  	if session[:source]
      greeting = "Thanks for visiting from #{session[:source]}, please feel free to 
                  #{link_to 'contact me', contact_me_path } if you'd like to work together."
  	  content_tag(:p, greeting.html_safe, class: styles)
    end 
  end

  def copyright_generator
    DannugViewTool::Renderer.copyright 'Norman Paul Dannug', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About'
      },
      {
        url: contact_me_path,
        title: 'Contact'
      },
      {
        url: tech_news_path,
        title: 'Tech News'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolios'
      },

    ]
      
  end
  
  def nav_helper style, tag_type, tag_style = ''
    nav_links = ""
    nav_items.each do |item|
      nav_links << 
        "<#{tag_type} class='#{tag_style}'>
        <a href= '#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a>
        </#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

end
