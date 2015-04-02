class AddNumVolunteersToEvents < ActiveRecord::Migration
  def change
    add_column :events, :num_volunteers, :integer
  end
end
