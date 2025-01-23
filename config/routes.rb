Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#index'
    resources :nutrients, only: [:index ]
      get 'nutrients/:id', to: 'ingredients#index', as: 'ingredient'
      get 'ingredients/:id', to: 'ingredients#show', as: 'ingredient_detail'
      get 'recipes/:id', to: 'recipes#show', as: 'recipe_show'
end 