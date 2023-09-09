class HomeController < ApplicationController
  def index
    redirect_to foods_path if user_signed_in?
    @recipes = Recipe.includes(:user).where(public: true)
    @recipe_foods = RecipeFood.includes(:food, :recipe).where(recipe: @recipes)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).where(public: true, id: params[:id])
    @recipe_foods = RecipeFood.includes(:food, :recipe).where(recipe: @recipe)

    @foods = Food.all
  end
end
