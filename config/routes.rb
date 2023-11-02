Rails.application.routes.draw do
  devise_for :users
  resources :bikes
end
