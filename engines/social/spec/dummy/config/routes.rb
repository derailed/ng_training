Rails.application.routes.draw do
  mount Social::Engine => "/social"
  
  resources :blog_posts do
    resources :comments, only: [:show, :index, :create]
  end
end