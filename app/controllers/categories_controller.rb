class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
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
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: "Category successfully updated."
    else
      flash.now[:error] = "The form contains some errors."
      render 'new'
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path, notice: "Category successfully deleted."
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
