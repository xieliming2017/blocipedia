Rails.application.routes.draw do
  devise_for :users

  resources :wikis
  resources :users

  resources :charges, only: [:new, :create]
  resources :downgrades
  resources :collaborators




  root 'welcome#index'

  get 'about' => 'welcome#about'

  post 'downgrades/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
