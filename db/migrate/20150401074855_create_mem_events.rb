class CreateMemEvents < ActiveRecord::Migration
  def change
    create_table :mem_events do |t|
      t.float :hours_attended
      t.references :members
      t.references :events
    end
  end
end
