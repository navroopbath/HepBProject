class AddFieldsToMembers < ActiveRecord::Migration
  def change
    create_table :members
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_column :members, :year, :string
    add_column :members, :phone, :int
    add_column :members, :email, :string
    add_column :members, :password, :string
    add_column :members, :is_admin, :boolean
    add_column :members, :hours, :int
  end
end
