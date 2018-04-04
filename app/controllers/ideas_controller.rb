class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = current_user.ideas.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "'#{@idea.title}' created successfully!"
      redirect_to ideas_path
    else
      flash[:failure] = "'#{@idea.title}' was not created. Please try again!"
      render :new
    end
  end

  def show
    @idea = current_user.ideas.find(params[:id])
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea = current_user.ideas.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} updated successfully!"
      redirect_to ideas_path
    else
      flash[:failure] = "#{@idea.title} could not be updated. Please try again!"
      redirect_to edit_idea_path(@idea)
    end
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])
    if @idea.destroy
      flash[:success] = "Deletion successful!"
    else
      flash[:failure] = "#{@idea.title} could not be deleted. Please try again!"
    end
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end
end
