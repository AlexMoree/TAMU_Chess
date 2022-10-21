Rails.application.routes.draw do
  resources :statistics
  resources :homes
  resources :qr_codes
  resources :attendences
  resources :personal_informations

  root 'homes#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
