class AddRemovedToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :removed, :boolean
  end
end
