class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} created successfully!"
      redirect_to idea_path(@idea)
    else
      flash[:failure] = "#{@idea.title} was not created. Please try again!"
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} updated successfully!"
      redirect_to ideas_path
    else
      flash[:failure] = "#{@idea.title} could not be updated. Please try again!"
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    if @idea.destroy
      flash[:success] = "#{@idea.title} deleted successfully!"
      redirect_to ideas_path
    else
      flash[:failure] = "#{@idea.title} could not be deleted. Please try again!"
      render :index
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
