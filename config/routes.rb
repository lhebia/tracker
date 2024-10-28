Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  
  resources :bikes

  resources :rides

  resources :users, only: [:index, :show, :edit, :update]
end
