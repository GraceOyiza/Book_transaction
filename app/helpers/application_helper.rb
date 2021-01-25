module ApplicationHelper
  def links_display
    links = ''
    if logged_in?
      links << link_to('Profile', books_path, class: 'text-white mr-3')
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

def ungrouped_calculate(arr)
  grouped = arr.reject { |item| item.groups.exists? }
  grouped.map(&:amount).inject(:+) || 0
end

def grouped_calculate(arr)
  grouped = arr.select { |item| item.groups.exists? }
  grouped.map(&:amount).inject(:+) || 0
end

def render_book_collection(collection, path)
  out = ''
  collection.each do |item|
    out << render(partial: path, locals: { book: item })
  end
  out.html_safe
end

def display_team_logo(group, book = nil)
  src = ''
  src << if (book && book.groups.length.positive?) && group.icon.attached?
           image_tag(url_for(group.icon), class: 'custom-card-img')
         else
           image_tag('homepage.png', class: 'custom-card-img')
         end
  src.html_safe
end

def render_group_collection(collection)
  out = ''
  collection.each do |item|
    out << render(partial: 'group', locals: { group: item })
  end
  out.html_safe
end
