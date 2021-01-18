require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'before_actions' do
    it { should use_before_action(:book_group) }
    it { should use_before_action(:authenticate_user!) }
  end
  describe 'GET #index' do
    before do
      User.create(username: 'somoye')
      session[:creator_id] = 1
      get :index
    end
    it { should render_template({}) }
    it { should_not render_template('show') }
  end
  describe 'GET #new' do
    before { get :new }
    it { should redirect_to(login_path) }
  end
  describe 'Post #create' do
    before do
      User.create(username: 'somoye')
      session[:creator_id] = 1
    end
    it do
      params = {
        group: {
          name: 'Education'
        }
      }
      should_not permit(:name)
        .for(:create, params: params)
        .on(:group)
    end
  end
end