Brog::Application.routes.draw do
  root 'welcome#index'

  mount Social::Engine => '/social', as: :social_ng
    
  resources :blog_posts do
    resources :comments, only: [:show, :index, :create], controller: 'social/comments'
  end
end