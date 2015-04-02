class DeleteYearFromMember < ActiveRecord::Migration
  def up
    remove_column :members, :year
  end

  def down
  end
end
