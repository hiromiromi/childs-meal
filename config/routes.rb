Rails.application.routes.draw do
  get 'ingredients/index'
  devise_for :users
  root to: 'meals#index'
    resources :nutrients
end