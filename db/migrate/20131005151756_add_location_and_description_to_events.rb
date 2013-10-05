class AddLocationAndDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :location, :string
    add_column :events, :description, :string
  end
end
