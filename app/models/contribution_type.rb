class ContributionType < ActiveRecord::Base
  validates_presence_of :name, uniqueness: true
end
