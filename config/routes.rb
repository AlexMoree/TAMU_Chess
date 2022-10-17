Rails.application.routes.draw do

  #for google auth
  # root to: 'dashboards#show' #maybe
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  resources :homes
  resources :lichesses
  resources :qr_codes
  resources :attendences
  resources :chesses
  resources :personal_informations

  root 'homes#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
