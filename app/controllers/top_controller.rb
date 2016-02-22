class TopController < ApplicationController

  def index
 @kouens = Kouen.order('id ASC').limit(6)
    end


end
