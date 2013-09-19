class AddColourToContributionTypes < ActiveRecord::Migration
  def self.up
    add_column :contribution_types, :colour, :string
  end
  
  def self.down
    remove_column :contribution_types, :colour
  end
end
