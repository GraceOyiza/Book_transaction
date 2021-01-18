require 'rails_helper'

RSpec.describe 'Routing', type: :routing do
  it do
    should route(:get, '/')
      .to(controller: :home_page, action: :index)
  end
  
  it do
    should route(:get, '/login')
      .to(controller: :sessions, action: :new)
  end
  it do
    should route(:post, '/login')
      .to(controller: :sessions, action: :create)
  end
  it do
    should route(:get, '/logout')
      .to(controller: :sessions, action: :destroy)
  end
  it do
    should route(:get, '/external/books')
      .to(controller: :books, action: :external)
  end
  it do
    should route(:get, '/groups')
      .to(controller: :groups, action: :index)
  end
  it do
    should route(:get, '/groups/new')
      .to(controller: :groups, action: :new)
  end
  it do
    should route(:post, '/groups')
      .to(controller: :groups, action: :create)
  end
  it do
    should route(:get, '/groups/1')
      .to(controller: :groups, action: :show, id: 1)
  end
  it do
    should route(:get, '/books')
      .to('books#index')
  end
  it do
    should route(:get, '/books/new')
      .to('books#new')
  end
  it do
    should route(:post, '/books')
      .to('books#create')
  end
  
  it do
    should route(:post, '/users')
      .to(controller: :users, action: :create)
  end
end