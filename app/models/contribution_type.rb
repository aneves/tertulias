class ContributionType < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_uniqueness_of :colour, :if => Proc.new{|ct| !ct.colour.blank?}
end
