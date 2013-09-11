Brog::Application.routes.draw do
  root 'welcome#index'
  
  resources :comments, only: [:create]
  
  resources :blog_posts do
    resources :comments, only: [:show, :index, :create]
  end
end