class Guest < ActiveRecord::Base
  belongs_to :user, :readonly => true
  validates_presence_of :name
  validates_uniqueness_of :name
end
