Rails.application.routes.draw do
  resources :lichesses
  resources :qr_codes
  resources :attendences
  resources :payment_statuses
  resources :personal_informations

  root 'personal_informations#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
