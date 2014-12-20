class RecipesController < ApplicationController
  before_action :recipe_set, only: [:show, :edit, :update, :destroy]
  before_action :not_signed_in, except: :show
  before_action :user_is_admin, only: [:index, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
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
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe sucessfully updated."
    else
      flash.now[:error] = "The form contains some errors."
      render 'new'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe successfully deleted."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :body, :ingredients, :category_id)
  end
  
  def recipe_set
    @recipe = Recipe.find(params[:id])
  end
end
