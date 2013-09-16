class Guest < ActiveRecord::Base
	belongs_to :user, :readonly => true
end
