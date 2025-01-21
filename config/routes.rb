Rails.application.routes.draw do
  get 'ingredients/index'
  devise_for :users
  root to: 'meals#index'
    resources :nutrients, only: [:index]
      get 'nutrients/:id', to: 'ingredients#index', as: 'ingredient'
end