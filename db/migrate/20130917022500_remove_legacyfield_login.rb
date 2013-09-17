class RemoveLegacyfieldLogin < ActiveRecord::Migration
  def self.up
    remove_column :comments, :user_login
    remove_column :contributions, :user_login
  end
  
  def self.down
    raise "Cannot undo this migration."
  end
end
