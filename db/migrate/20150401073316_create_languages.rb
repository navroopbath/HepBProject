class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :lang
      t.string :fluency
      t.references :members
    end
  end
end
