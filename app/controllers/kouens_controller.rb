class KouensController < ApplicationController
before_action :authenticate_user!, except: :search
  
  def show
    @kouen = Kouen.find(params[:id])
  end


  def create
 Review.create(nickname: params[:name], review: params[:text])
  end

    def search
    @kouens = Kouen.where('title LIKE ?', "%#{params[:keyword]}%")
    end


def move_to_index
      redirect_to action: :show unless user_signed_in?
    end


end