class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:create, :destroy],if: -> { params[:recipe_id].present? }
  before_action :set_column, only: [:create, :destroy], if: -> { params[:column_id].present? }

  def new
    @favorite = Favorite.new
  end

  def create
    if params[:recipe_id].present?
      @favorite = current_user.favorites.new(recipe_id: params[:recipe_id])
    elsif params[:column_id].present?
      @favorite = current_user.favorites.new(column_id: params[:column_id])
    else
      Rails.logger.error("お気に入り登録失敗: recipe_id も column_id もありません")
      redirect_to request.referer, alert: 'お気に入り登録に失敗しました。'
      return
    end
  
    if @favorite.save
      respond_to do |format|
        format.js
        format.html { redirect_to request.referer, notice: 'お気に入りに登録しました！' }
      end
    else
      Rails.logger.error("お気に入り登録失敗: #{@favorite.errors.full_messages.join(", ")}")
      respond_to do |format|
        format.html { redirect_to request.referer, alert: 'お気に入り登録に失敗しました。' }
      end
    end
  end
  

  def destroy
    if params[:recipe_id].present?
      @favorite = Favorite.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
    elsif params[:column_id].present?
      @favorite = Favorite.find_by(user_id: current_user.id, column_id: params[:column_id])
    end
  
    if @favorite
      @favorite.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to request.referer, notice: 'お気に入りから削除しました！' }
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referer, alert: '削除に失敗しました。' }
      end
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