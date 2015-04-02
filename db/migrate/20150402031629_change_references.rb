class ChangeReferences < ActiveRecord::Migration
  def change
    change_table :memevents do |t|
      t.remove :members_id
      t.remove :events_id
      t.references :member
      t.references :event
    end
    change_table :languages do |t|
      t.remove :members_id
      t.references :member
    end
  end

end
