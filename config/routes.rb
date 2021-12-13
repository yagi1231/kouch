Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :reservations do
    collection do
      get 'price'
    end
  end
  resources :infos
  root "reservations#appDescription"
  post "reservations/new" => "reservations#new"
  post "reservations/create" => "reservations#create"
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
