class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.save
    redirect_to idea_path(@idea)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
