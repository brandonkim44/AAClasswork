# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  name        :string           not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
include ActionView::Helpers::DateHelper

    COLORS = %w[red blue black white green orange violet]

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: { in: %w(red blue black white green orange violet),
    message: "%{value} is not a valid color" }

    validates :name, presence: true
    validates :sex, presence: true, inclusion: { in: %w(M F),
    message: "%{value} is not a valid sex" }

    validates :description, presence: true

    def age
        @birth_date = self.birth_date #yyyy/mm/dd
        @age = time_ago_in_words(@birth_date)
        @age
    end
end
