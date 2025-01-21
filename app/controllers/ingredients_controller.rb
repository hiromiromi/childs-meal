class IngredientsController < ApplicationController
  
  def index
    @nutrient = Nutrient.find(params[:id])
  end

  def show
  end

end