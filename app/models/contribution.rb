class Contribution < ActiveRecord::Base
	belongs_to :user, :readonly => true
end
