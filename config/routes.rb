Brog::Application.routes.draw do
  root 'welcome#index'
  
  resources :comments, only: [:create, :show]
  
  resources :blog_posts do
    resources :comments, only: [:show, :index, :create]
  end
end