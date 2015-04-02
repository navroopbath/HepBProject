class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :location
      t.datetime :date
      t.float :duration
    end
  end
end
