class KouensController < ApplicationController
  def show
    @kouen = Kouen.find(params[:id])
  end

  def new

  end

  def create
 Review.create(name: params[:name], image: params[:image], text: params[:text])
  end

def move_to_index
      redirect_to action: :show unless user_signed_in?
    end


  def search
    @kouens = Kouen.where('title LIKE ?', "%#{params[:keyword]}%")
  end
end