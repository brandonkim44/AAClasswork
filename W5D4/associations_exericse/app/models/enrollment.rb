# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    belongs_to :user,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :User

    belongs_to :course,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Course
end


# user -> course id

#enrollment is a join table that represents all courses taken by students, and all students taking courses


# an enrollment belongs to a student (student_id)
# an enrollment belongs to a course (course_id)
# a user has_many courses through enrollments
# a course has many users through enrollments