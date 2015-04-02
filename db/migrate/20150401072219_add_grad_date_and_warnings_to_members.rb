class AddGradDateAndWarningsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :grad_date, :datetime
    add_column :members, :warnings, :integer
  end
end
