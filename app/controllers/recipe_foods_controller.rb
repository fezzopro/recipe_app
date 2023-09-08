class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]
  def index; end

  def new; end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Ingredient was successfully added.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Recipe was successfully deteted.' }
    end
  end

  private

  def recipe_food_params
    params.permit(:food_id, :quantity, :recipe_id)
  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end
end
