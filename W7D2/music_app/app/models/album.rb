# == Schema Information
#
# Table name: albums
#
#  id      :bigint           not null, primary key
#  title   :string           not null
#  year    :integer          not null
#  band_id :integer          not null
#  sound   :boolean          default(TRUE)
#  boolean :boolean          default(TRUE)
#
class Album < ApplicationRecord
    validates :title, :year, :band_id, :sound, presence: true

    belongs_to :band,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: :Band

    self.sound ? self.sound == 'live' : self.sound == 'studio'
end
