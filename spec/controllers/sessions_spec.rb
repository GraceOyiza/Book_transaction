require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    it { should render_template('new') }
    it { should_not redirect_to(login_path) }
  end
  describe 'Post #create' do
    before do
      User.create(username: 'love')
      @user = User.find_by(username: 'yeyewd')
    end
    it { should_not render_template('new') }
  end
end