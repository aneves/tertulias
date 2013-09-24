class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :when
      t.integer :owner_id

      t.timestamps
    end


    add_column :guests,           :event_id, :int
    add_column :contributions,    :event_id, :int
    add_column :comments,         :event_id, :int


    say_with_time 'Creating default Event.' do
      xmas_date = DateTime.new(DateTime.now.year, 12, 24, 11, 59, 59)
      someone = User.first
      default_owner = someone == nil ? nil : someone.id
      xmas = Event.new(:name => "Christmas #{xmas_date.year}", :when => xmas_date, :owner_id => default_owner)
      xmas.save!

      Guest.update_all(:event_id => xmas.id)
      Contribution.update_all(:event_id => xmas.id)
      Comment.update_all(:event_id => xmas.id)
    end


    change_column :guests,        :event_id, :int, :null => false #SQLite
    change_column :contributions, :event_id, :int, :null => false #SQLite
    change_column :comments,      :event_id, :int, :null => false #SQLite
  end
end
