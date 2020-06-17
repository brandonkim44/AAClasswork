class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artist_id, null: false
      t.integer :artwork_id, null: false
    end
    add_index :artwork_shares, :artist_id, unique: true
    add_index :artwork_shares, :artwork_id, unique: true
  end
end
