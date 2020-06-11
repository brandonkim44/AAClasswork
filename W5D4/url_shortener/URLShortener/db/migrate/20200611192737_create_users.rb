class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false #t represents table, string represents the data type, column name, fourth is a constraint
      t.timestamps
    end
    add_index :users, :email, unique: true #makes it so email has to be unique when the user is logging in
  end
end
