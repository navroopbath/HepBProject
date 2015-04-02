class AddWaitlistFunctionalityToMemEvents < ActiveRecord::Migration
  def change
    add_column :mem_events, :waitlisted, :boolean
    add_column :mem_events, :date_added, :datetime
  end
end
