Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, :controllers  => { :registrations => 'registration/registrations' }
  
  resources :bikes

  resources :rides

  resources :purchase_transactions

  resources :users, only: [:index, :show, :edit, :update]

  resources :vendors
end
