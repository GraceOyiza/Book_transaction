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
    
    doc << "<div class='d-flex mt-5'> #{ image_tag(url_for(group.icon), class: 'icon mt-5 ')} </div>"
    doc << "<p  class='font-weight-bold text-uppercase '>#{group.name}</p>"
    doc << "#{link_to( 'Edit', edit_group_path(group), class: ' btn btn-success mb-0 edit-width')}"   
    
    end
    doc.html_safe
  end
end
