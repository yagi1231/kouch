Rails.application.routes.draw do
  devise_for :users
  resources :reservations do
    collection do
      get 'price'
    end
  end
  resources :users
  resources :infos
  root 'reservations#index'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  get 'infos/:id' => 'infos#show'
  post 'infos/create' => 'infos#create'

  post 'reservations/new' => 'reservations#new'
  post 'reservations/create' => 'reservations#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
