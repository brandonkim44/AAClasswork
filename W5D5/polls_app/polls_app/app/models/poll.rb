# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Poll < ApplicationRecord
    validates :title, presence: true
    validates :author_id, presence: true

    has_many :questions
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :Question

    belongs_to :author
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User
    
end
