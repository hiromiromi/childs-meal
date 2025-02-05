class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients

    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id) if user_signed_in?
  end
end
