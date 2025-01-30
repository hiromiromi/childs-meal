class IngredientsController < ApplicationController
  
  def index
    @nutrient = Nutrient.find(params[:id])
    @ingredients = Ingredient.where(nutrient_id: params[:id])
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes
  end

  def search
    @ingredients = Ingredient.search(params[:keyword])
    render :search 
  end

end