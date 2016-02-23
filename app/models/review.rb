class Review < ActiveRecord::Base

belongs_to :kouen
belongs_to :user

end
