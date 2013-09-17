class AddUserToCommentsAndContributions < ActiveRecord::Migration
  def self.up
    add_column    :comments, :user_id, :integer
    change_column :comments, :user_id, :integer, :null => false #SQLite
    
    add_column    :contributions, :user_id, :integer
    change_column :contributions, :user_id, :integer, :null => false #SQLite
  end
  
  def self.down
    remove_column :comments, :user_id
    remove_column :contributions, :user_id
  end
end
