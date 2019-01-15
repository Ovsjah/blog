Rails.application.routes.draw do
  root 'categories#index'
  resources :categories

  resources :categories do
    post 'comments', to: 'comments#create'
  end

  resources :posts do
    post 'comments', to: 'comments#create'
  end
end
