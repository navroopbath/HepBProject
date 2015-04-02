class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.datetime :date_written
      t.text :body
      t.boolean :pinned
      t.string :type
    end
  end
end
