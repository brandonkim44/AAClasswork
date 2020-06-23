class EditUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
    add_index :users, [:email, :session_token], unique: true
  end
end
