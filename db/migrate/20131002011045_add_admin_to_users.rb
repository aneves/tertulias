class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    someone = User.first
    someone.admin = true
    someone.save!
  end
end
