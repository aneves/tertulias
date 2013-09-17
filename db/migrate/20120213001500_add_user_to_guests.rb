class AddUserToGuests < ActiveRecord::Migration
  def self.up
	add_column    :guests, :user_id, :integer
	change_column :guests, :user_id, :integer, :null => false #SQLite
  end
  
  def self.down
	remove_column :guests, :user_id
  end
end
