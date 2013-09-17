class Contribution < ActiveRecord::Base
	belongs_to :user, :readonly => true
	belongs_to :contribution_type
end
