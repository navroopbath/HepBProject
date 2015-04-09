class AddApprovedColumnToMemevents < ActiveRecord::Migration
  def change
    add_column :memevents, :approved, :boolean
  end
end
