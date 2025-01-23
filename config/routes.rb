Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#index'
  resources :ingredients, only: [:index] do
    collection do
      get 'search'
    end
  end
  resources :nutrients, only: [:index ]
      get 'nutrients/:id', to: 'ingredients#index', as: 'ingredient'
      get 'ingredients/:id', to: 'ingredients#show', as: 'ingredient_detail'
      get 'recipes/:id', to: 'recipes#show', as: 'recipe_show'
  resources :columns, only: [:index ,:show]

end 