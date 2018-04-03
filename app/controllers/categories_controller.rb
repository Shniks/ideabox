class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "'#{@category.name}' created successfully!"
      redirect_to categories_path
    else
      flash[:failure] = "'#{@category.name}' was not created. Please try again!"
      redirect_to new_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
