class RemoveCommentDate < ActiveRecord::Migration
  def change
    remove_column :comments, :date
  end
end
