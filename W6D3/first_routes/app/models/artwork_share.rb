# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artist_id  :integer          not null
#  artwork_id :integer          not null
#
class ArtworkShare < ApplicationRecord
    belongs_to :viewer,
        primary_key: :id, 
        foreign_key: :artist_id,
        class_name: :User

    belongs_to :artwork,
        primary_key: :id, 
        foreign_key: :artwork_id,
        class_name: :Artwork
    
end
