require 'rails_helper'

RSpec.describe 'User details', type: :feature do
  user = nil

  def sign_in(user)
    visit login_path
    fill_in 'session_username', with: user.username
    click_button 'Log in'
  end

  before do
    user = User.create(username: 'Grace')
    visit login_path
    fill_in 'session_username', with: user.username
    click_button 'Log in'
  end
  it 'should allow users to signup' do
    visit new_user_path
    fill_in 'Username', with: 'boluwatifel'
    click_button 'Sign Up'
  end

  it ' should signup the user ' do
    sign_in(user)
    p user
  end
  it 'should log the user in' do
    visit login_path
    fill_in 'session_username', with: user.username
    click_button 'Log in'

    expect(page).to have_text(user.username)
  end

  before do
    User.create(username: 'Ade')
    Group.create(name: 'Romantic', creator_id: 1)
    Book.create(title: 'Love Life', amount: 500, creator_id: 1)
    Book.create(title: 'Bride to be', amount: 2000, creator_id: 1)
    BookGroup.create(book_id: 1, group_id: 1)
  end

  it 'should show this information for a login user ' do
    visit '/login'
    fill_in 'Username', with: 'Ade'
    click_button 'Log in'
    expect(page).to have_content 'My Groups'
    expect(page).to have_content 'My Expenses'
    expect(page).to have_content 'My External expenses'
    expect(page).to_not have_content 'log In'
    expect(page).to_not have_content 'Sign Up'
  end

  before do
    User.create(username: 'Ade')
  end

  it 'display this when my group is clicked on ' do
    visit '/login'
    fill_in 'Username', with: 'Ade'
    click_button 'Log in'
    click_link 'My Groups'
    click_link 'New Group'
    expect(page).to have_current_path('/groups/new')
    expect(page).to have_content 'Upload book image'
    click_button 'Add Book Group'
    expect(page).to_not have_current_path('/login')
    expect(page).to have_current_path('/groups')
  end
end
