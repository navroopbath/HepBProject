class AddFieldsToMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :year
      t.integer :phone, :limit => 8
      t.string :email
      t.string :password
      t.boolean :is_admin
    end
  end
end
