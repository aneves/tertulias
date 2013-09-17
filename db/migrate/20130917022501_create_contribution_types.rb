class CreateContributionTypes < ActiveRecord::Migration
  def self.up
    create_table :contribution_types do |t|
      t.string :name
    end
    say 'Creating default ContributionType.'
    default = ContributionType.new(:name => "default")
	default.save!
	id = default.id
    add_column :contributions, :contribution_type_id, :int, :null => false, :default => id
  end
  
  def self.down
    drop_table :contribution_types
    remove_column :contributions, :contribution_type_id
  end
end
