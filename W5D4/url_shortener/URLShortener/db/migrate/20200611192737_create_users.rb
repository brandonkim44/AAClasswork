class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false #t represents table, string represents the data type, column name, fourth is a constraint
      t.timestamps
    end
    add
  end
end
