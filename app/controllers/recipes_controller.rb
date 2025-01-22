class RecipesController < ApplicationController

  def show
    @recipe = Recipes.find(params[:id])
  end
end
