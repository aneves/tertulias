class Event < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :guests
  has_many :contributions
  has_many :comments

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :when
  validates_presence_of :location

  def future?
    return self.when > Date.today
  end

  def belongs_to? someone
    return true if owner == nil
    return false if someone == nil
    return owner.id == someone.id
  end
  def belongs_to! someone
    raise "Don't hack me bro!" unless belongs_to? someone
  end
end
