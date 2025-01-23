class IngredientsController < ApplicationController
  
  def index
    @nutrient = Nutrient.find(params[:id])
    @ingredients = Ingredient.where(nutrient_id: params[:id])
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = Recipe.all
  end

end