class ImagesController < ApplicationController
  before_action :require_admin

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
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

  private

  def require_admin
    render file: "/public/404" unless current_admin?
  end
    
  def image_params
    params.require(:image).permit(:name, :url)
  end
end
