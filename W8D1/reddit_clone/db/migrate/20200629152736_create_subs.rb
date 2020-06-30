class CreateSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :author_id, null: false
    end
    add_index :subs, :author_id, unique: true
    add_index :subs, :title, unique: true
  end
end
