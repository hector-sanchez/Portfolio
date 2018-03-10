module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
      (link_to 'Register', new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}. You are on the #{layout_name} layout"
      content_tag(:p, greeting, class: 'greeting')
    end
  end

  def copyright_generator
    @copyright = EllaSoftViewTool::Renderer.copyright "Hector Sanchez", "All rights reserved."
  end

  def nav_helper(style, tag_type='span')
    nav_links = ''

    nav_items.each do |nav_item|
      nav_links << "<#{tag_type}><a href='#{nav_item[:url]}' class='#{style} #{active? nav_item[:url]}'>#{nav_item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def nav_items
    [
      { url: root_path, title: 'Home' },
      { url: about_me_path, title: 'About Me' },
      { url: contact_path, title: 'Contact ' },
      { url: blogs_path, title: 'Blogs' },
      { url: portfolios_path, title: 'Portfolio' }
    ]
  end

  def active?(path)
    'active' if current_page? path
  end
end
