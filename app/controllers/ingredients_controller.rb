class IngredientsController < ApplicationController
  
  def index
    @nutrient = Nutrient.find(params[:id])
    @ingredients = Ingredient.where(nutrient_id: params[:id])
  end

  def show
  end

end