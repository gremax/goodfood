class CategoriesController < ApplicationController
  before_action :category_set, only: [:show, :edit, :update, :destroy]
  before_action :user_is_admin

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_category_path, notice: "Category successfully added."
    else
      flash.now[:error] = "The form contains some errors."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Category successfully updated."
    else
      flash.now[:error] = "The form contains some errors."
      render 'new'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category successfully deleted."
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  def category_set
    @category = Category.find(params[:id])
  end
end
