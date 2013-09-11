require 'spec_helper'

describe WelcomeController do
  it 'nav to the index page correctly' do
    get :index
    
    response.should render_template :index    
  end
end