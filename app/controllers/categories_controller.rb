class CategoriesController < ApplicationController
  before_action :require_admin
  before_action :set_category, only: %i[show destroy]

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
      flash[:success] = "'#{@category.name}' created successfully!"
      redirect_to categories_path
    else
      flash[:failure] = "'#{@category.name}' was not created. Please try again!"
      render :new
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Deletion successful!"
    else
      flash[:failure] = "'#{@category.name}' could not be deleted. Please try again!"
    end
    redirect_to categories_path
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def require_admin
      render file: "/public/404" unless current_admin?
    end

  def category_params
    params.require(:category).permit(:name)
  end
end
