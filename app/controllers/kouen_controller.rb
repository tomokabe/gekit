class KouenController < ApplicationController


  def index
    @kouen = Kouen.all
    end


end
