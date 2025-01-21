class MealsController < ApplicationController

  def index
    @categories = Nutrient.all
  end
  
end
