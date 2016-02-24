class ReviewsController < ApplicationController
before_action :authenticate_user!, only: :new

  def show
    @kouen = Kouen.find(params[:kouen_id])
  end

  def new
    @kouen = Kouen.find(params[:kouen_id])
    @review = Review.new
  end

  def create
 Review.create(create_params)
 redirect_to controller: :kouens, action: :index
  end

  private
  def create_params
  params.require(:review).permit(:title, :rate, :review).merge(kouen_id: params[:kouen_id], user_id: current_user.id)
  end


end
