# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :user

    belongs_to :prerequisite, #use belongs_to when there is a dependency in the column of course
        primary_key: :id,
        foreign_key: :prereq_id,
        class_name: :Course

    belongs_to :instructor, #look in this class_name, look for this foreign_key and have it match this primary_key
        primary_key: :id, #must be from this class
        foreign_key: :instructor_id, 
        class_name: :User
end
