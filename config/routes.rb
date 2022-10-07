Rails.application.routes.draw do
  resources :homes
  resources :logins

  get 'login', to 'logins#new'
  post 'login', to 'logins#show'
  
  resources :lichesses
  resources :qr_codes
  resources :attendences
  resources :chesses
  resources :personal_informations

  root 'logins#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
