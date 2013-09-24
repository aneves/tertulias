class Contribution < ActiveRecord::Base
  belongs_to :user, :readonly => true
  belongs_to :contribution_type
  belongs_to :event

  validates_presence_of :name
  validates_uniqueness_of :name
end
