class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:create, :destroy]
  before_action :set_column, only: [:create, :destroy]

  def new
    @favorite = Favorite.new
  end

  def create
    @favorites_recipe = Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
      respond_to do |format|
        format.js
      end
    @favorites_column = Favorite.create(user_id: current_user.id, column_id: @column.id)
  end

  def destroy
    @favorite_recipe = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @favorite.destroy if @favorite_recipe

    @favorite_column = Favorite.find_by(user_id: current_user.id, column_id: @column.id)
    @favorite_column.destroy if @favorite_column

    respond_to do |format|
      format.js # d
    end
  end

  def index
    @favorites = current_user.favorites.includes(:recipe, :column) #includesでN+1問題対策
  end


private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_column
    @column = Column.find(params[:column_id])
  end

end