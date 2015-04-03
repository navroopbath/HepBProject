class DeleteHoursFromMembers < ActiveRecord::Migration
  def up
    remove_column :members, :hours
  end

  def down
  end
end
