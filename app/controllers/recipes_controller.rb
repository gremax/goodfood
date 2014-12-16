class RecipesController < ApplicationController
  before_action :not_signed_in, except: :show

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe.update_attribute(:views, @recipe.views += 1)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Recipe successfully added."
    else
      flash.now[:error] = "The form contains some errors."
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe sucessfully updated."
    else
      flash.now[:error] = "The form contains some errors."
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path, notice: "Recipe successfully deleted."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :body, :ingredients, :category_id)
  end
end
