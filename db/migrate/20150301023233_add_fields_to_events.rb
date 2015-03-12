class AddFieldsToEvents < ActiveRecord::Migration
  def change
    create_table :events
    add_column :events, :name, :string
    add_column :events, :date, :datetime
    add_column :events, :location, :string
    add_column :events, :description, :string
    add_column :events, :start_time, :datetime
    add_column :events, :duration, :datetime
    add_column :events, :num_volunteers, :int
    add_column :events, :num_waitlist, :int
  end
end
