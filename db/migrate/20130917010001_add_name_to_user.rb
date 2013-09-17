class AddNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string, :null => true
    say_with_time "Setting email as name for all users..." do
      User.find(:all).each do |u|
        u.update_attribute :name, u.email
      end
      change_column :users, :name, :string, :null => false
    end
  end
  
  def self.down
    remove_column :users, :name
  end
end
