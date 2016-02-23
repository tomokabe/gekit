class TopController < ApplicationController

  def index
 @kouens = Kouen.order('id ASC').limit(6)
    end

  def now
 @kouens = Kouen.order('id ASC').limit(9)
  end

end
