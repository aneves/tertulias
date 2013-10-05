class CreateContributionTypes < ActiveRecord::Migration
  def self.up
    create_table :contribution_types do |t|
      t.string :name
    end
    add_column :contributions, :contribution_type_id, :int, :null => false
  end
  
  def self.down
    drop_table :contribution_types
    remove_column :contributions, :contribution_type_id
  end
end
