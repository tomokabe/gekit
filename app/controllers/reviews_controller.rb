class ReviewsController < ApplicationController

  def create
 Review.create(name: params[:name], image: params[:image], text: params[:text])
  end

  def new

  end

end
