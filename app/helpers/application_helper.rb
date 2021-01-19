module ApplicationHelper
  def links_display
    links = ''
    if logged_in?
      links << link_to('Logout', logout_path, method: :delete, class: 'text-white')
    else
      links << link_to('Log In', login_path, class: 'text-white pr-3')

      links << link_to('Sign Up', new_user_path, class: 'text-white')
    end
    links.html_safe
  end

  def group_array(groups)
    doc = ''
    groups.each do |group|
      doc << link_to(image_tag(url_for(group.icon)), books_path, class: 'icon ')
      doc << "<div  class='font-weight-bold text-uppercase shadow group-styling external-display'>#{group.name}"
      doc << "<div class='text-muted  '>#{group.created_at}</div></div>"
    end
    doc.html_safe
  end
end
