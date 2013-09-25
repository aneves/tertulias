class Guest < ActiveRecord::Base
  belongs_to :user, :readonly => true
  belongs_to :event

  validates_presence_of :name
  validates_uniqueness_of :name

  after_initialize :set_default_values

  def belongs_to? someone
    return true if user == nil
    return false if someone == nil
    return user.id == someone.id
  end
  def belongs_to! someone
    raise "Don't hack me bro!" unless belongs_to? someone
  end

  private
    def set_default_values
      return unless new_record?
      self.coming = true if self.coming.nil?
    end
end
