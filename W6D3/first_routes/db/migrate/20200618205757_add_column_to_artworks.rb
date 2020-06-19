class AddColumnToArtworks < ActiveRecord::Migration[5.2]
  def change
      add_column :artworks, :favoriter_id, :integer
  end
end
