class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe
  before_action :set_column

def create
  @favorites_recipe = Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
  @favorites_column = Favorite.create(user_id: current_user.id, column_id: @column.id)
  
end

def destroy
  @favorite_recipe = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
  @favorite_recipe.destroy

  @favorite_column = Favorite.find_by(user_id: current_user.id, column_id: @column.id)
  @favorite_column.destroy
end


private
def set_recipe
  @recipe = Recipe.find(params[:recipe_id])
end

def set_column
  @column = Column.find(params[:column_id])
end

end