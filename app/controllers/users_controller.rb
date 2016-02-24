class UsersController < ApplicationController
def show
  @user = User.find(params[:id])
  @kouen = Kouen.find(params[:id])
  
    end


end
