class Event < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :guests
  has_many :contributions
  has_many :comments

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :when
end
