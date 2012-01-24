class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamp :date
      t.string :user_login
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
