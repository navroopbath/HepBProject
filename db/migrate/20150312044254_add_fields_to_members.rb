class AddFieldsToMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :year
      t.float :phone
      t.string :email
      t.string :password
      t.boolean :is_admin
      t.integer :hours
    end
    # add_column :members, :first_name, :string
    # add_column :members, :last_name, :string
    # add_column :members, :year, :string
    # add_column :members, :phone, :bigint
    # add_column :members, :email, :string
    # add_column :members, :password, :string
    # add_column :members, :is_admin, :boolean
    # add_column :members, :hours, :int
  end
end
