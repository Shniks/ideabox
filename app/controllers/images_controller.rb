class ImagesController < ApplicationController
  before_action :require_admin
  before_action :set_image, only: %i[show destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "'#{@image.name}' created successfully!"
      redirect_to images_path
    else
      flash[:failure] = "'#{@image.name}' was not created. Please try again!"
      render :new
    end
  end

  def destroy
    if @image.destroy
      flash[:success] = "Deletion successful!"
    else
      flash[:failure] = "'#{@image.name}' could not be deleted. Please try again!"
    end
    redirect_to images_path
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def image_params
    params.require(:image).permit(:name, :url)
  end
end
