# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Response < ApplicationRecord
    validates :author_id, presence: true
    validates :answer_id, presence: true

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_id,
        class_name: :Answer

    belongs_to :respondent,
        foreign_key: :author_id,
        class_name: :User,
        primary_key: :id
end
