class TopController < ApplicationController

  def index
 @kouens = Kouen.order('id ASC').limit(4)
    end


end
