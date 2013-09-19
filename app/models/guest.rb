class Guest < ActiveRecord::Base
  belongs_to :user, :readonly => true
  validates_presence_of :name
  validates_uniqueness_of :name

  after_initialize :set_default_values

  private
    def set_default_values
      self.coming ||= true
    end
end
