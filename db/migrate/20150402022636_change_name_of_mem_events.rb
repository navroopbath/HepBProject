class ChangeNameOfMemEvents < ActiveRecord::Migration
  def change
    rename_table :mem_events, :memevents
  end
end
