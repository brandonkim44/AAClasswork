# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  author_id   :integer          not null
#
class Sub < ApplicationRecord
    validates :description, :author_id, presence: true
    validates :title, presence: true, uniqueness: true

    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User
    
    has_many :postsubs,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :PostSub
    
    has_many :posts,
        through: :postsubs,
        source: :post
end
