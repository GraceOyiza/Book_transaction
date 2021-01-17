module ApplicationHelper
  def links_display
    links = ''
    if logged_in?
      links << link_to('Logout', logout_path, method: :delete, class: "text-white")
    else
      links << link_to('Log In', login_path, class: "text-white pr-3" )
    
      links << link_to('Sign Up', new_user_path, class: "text-white")
    end
    links.html_safe
  end
  
  def group_array(groups)
    doc = ''
    groups.each do |group|
    doc << "<p>#{group.name}</p>"
    doc << "<div class='d-flex '> #{ image_tag(url_for(group.icon), class: 'icon ')}"
    doc << "#{link_to( 'Edit', edit_group_path(group), class: 'mt-5 btn btn-success mb-0')}</div>" 
    end
    doc.html_safe
  end
end
