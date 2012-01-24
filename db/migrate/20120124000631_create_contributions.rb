class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :name
      t.string :user_login

      t.timestamps
    end
  end
end
