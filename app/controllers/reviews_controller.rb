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
  binding.pry
 Review.create(create_params)
 kouen = Kouen.find(params[:kouen_id])
 redirect_to kouen_path(kouen)

  end

  private
  def create_params
  params.permit(:title, :review).merge(user_id: current_user.id, kouen_id: params[:kouen_id])
  end


end
