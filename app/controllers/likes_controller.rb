class LikesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.save
    redirect_to root_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path
  end

  private

  def like_params
    params.require(:like).permit(:liker_id, :saying_id)
  end

end
