class KouensController < ApplicationController
  def show
    @kouen = Kouen.find(params[:id])
  end

  def search
    @kouens = Kouen.where('title LIKE ?', "%#{params[:keyword]}%")
  end
end