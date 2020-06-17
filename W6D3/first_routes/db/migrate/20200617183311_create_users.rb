class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :favorite_food, null: false
      t.text :name, null: false
    end
  end
end
