Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :reservations do
    collection do
      get 'price'
      get 'appDescription'
    end
  end
  resources :infos
  root "reservations#appDescription"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
