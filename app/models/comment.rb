class Comment < ActiveRecord::Base
	belongs_to :user, :readonly => true
	belongs_to :event

	validates_presence_of :title

	def self.latest
		Comment.find(:all, :order => "created_at desc", :limit => 5)
	end
end
