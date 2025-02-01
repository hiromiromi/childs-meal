class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
    @columns = @user.columns

    favorites_recipe = Favorite.where(user_id: current_user.id).pluck(:recipe_id)
    favorites_column = Favorite.where(user_id: current_user.id).pluck(:column_id) 

    @favorite_list_recipe = Recipe.find(favorites_recipe)
    @favorite_list_column = Column.find(favorites_column) 
  end
end
