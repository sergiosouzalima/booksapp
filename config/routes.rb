Rails.application.routes.draw do
  root to: 'books#index'

  resources :books do
    resource :like, module: :books
  end
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
