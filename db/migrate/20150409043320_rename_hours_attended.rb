class RenameHoursAttended < ActiveRecord::Migration
  def change
    rename_column :memevents, :hours_attended, :hours
  end
end
