Rails.application.routes.draw do
  devise_for :users 
  
  root to: 'meals#index'
  resources :ingredients, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  get 'nutrients/:id', to: 'ingredients#index', as: 'nutrient_ingredients'

  resources :recipes, only: [:show] do
    resources :favorites, only: [:create, :destroy]
  end

  resources :columns, only: [:index ,:show] do
    resources :favorites, only: [:create, :destroy]
  end

  resources :users, only: [] do
    resources :favorites, only: [:index]
  end

end 