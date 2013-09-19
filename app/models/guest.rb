class Guest < ActiveRecord::Base
  belongs_to :user, :readonly => true
  validates_presence_of :name
  validates_uniqueness_of :name

  after_initialize :set_default_values

  private
    def set_default_values
      return unless new_record?
      self.coming = true if self.coming.nil?
    end
end
