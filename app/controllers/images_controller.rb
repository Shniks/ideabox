class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "'#{@image.url}' created successfully!"
      redirect_to categories_path
    else
      flash[:failure] = "'#{@category.name}' was not created. Please try again!"
      render :new
  end


  private

  def image_params
    params.require(:image).permit(:url)
  end
end
