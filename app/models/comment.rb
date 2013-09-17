class Comment < ActiveRecord::Base
	belongs_to :user, :readonly => true
end
