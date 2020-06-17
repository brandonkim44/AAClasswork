# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :text             not null
#  image_url :text             not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord
    validates :artist_id, presence: true, uniqueness: { scope: :title, message: "You must have a unique title"}
    validates :image_url, presence: true
    validates :title, presence: true

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User
end
