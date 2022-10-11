Rails.application.routes.draw do
  resources :homes
  resources :logins
  resources :users, only:[:new, :create]
  resources :lichesses
  resources :qr_codes
  resources :attendences
  resources :chesses
  resources :personal_informations

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy'

  root 'logins#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
