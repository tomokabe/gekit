class KouensController < ApplicationController
before_action :authenticate_user!, except: :search
  
  def show
    @kouen = Kouen.find(params[:id])
  end


  def create
 Review.create(nickname: params[:name], review: params[:text])
  end

def search
    @kouens = Kouen.all
    if params[:keyword]
      @kouens = @kouens.where('title LIKE ? OR detail LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end # もしkeywordがあるなら、それをtitleかdetailに含むものを引っ張ってくる

    if params[:category]
      @kouen = @kouen.where('category LIKE ?', "%#{params[:category]}%")
    end # さらにcategoryがあるなら、categoryがそれを含むものを引っ張ってくる

    # どちらもある場合は、二つの絞り込みがされる
  end

    def move_to_index
      redirect_to action: :show unless user_signed_in?
    end

end