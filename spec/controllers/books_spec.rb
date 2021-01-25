require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'before_action' do
    it { should use_before_action(:authenticate_user!) }
  end
  describe 'GET #index' do
    before do
      User.create(username: 'grace')
      session[:creator_id] = 1
    end

    it { should_not render_template('external') }
  end
  describe 'GET #external' do
    before do
      User.create(username: 'somoye')
      session[:creator_id] = 1
    end

    it { should_not render_template('index') }
  end
  describe 'GET #new' do
    before { get :new }
    it { should redirect_to(login_path) }
  end
  describe 'Post #create' do
    before do
      User.create(username: 'garce')
      session[:creator_id] = 1
    end
    it do
      params = {
        book: {
          name: 'love',
          amount: 700

        }
      }
      should_not permit(:name, :amount)
        .for(:create, params: params)
        .on(:book)
    end
  end
end
