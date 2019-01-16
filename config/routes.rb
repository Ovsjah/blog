Rails.application.routes.draw do
  root 'categories#index'

  concern :commentable do
    resources :comments, only: :create
  end

  resources :categories, concerns: :commentable
  resources :posts, concerns: :commentable
end
