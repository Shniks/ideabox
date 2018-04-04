class IdeasController < ApplicationController
  before_action :require_login
  before_action :set_idea, only: %i[show edit update destroy]

  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = Idea.new
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
  end

  def edit
  end

  def update
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
    if @idea.destroy
      flash[:success] = "Deletion successful!"
    else
      flash[:failure] = "#{@idea.title} could not be deleted. Please try again!"
    end
    redirect_to ideas_path
  end

  private

  def set_idea
    @idea = current_user.ideas.find(params[:id])
  end

  def require_login
    render file: "/public/404" unless current_user
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :image_ids => [])
  end
end
