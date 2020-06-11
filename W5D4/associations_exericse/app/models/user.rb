# Table name: users
#
#  id            :bigint           not null, primary key
#  name          :string           
#  created_at    :datetime         not null
#  updated_at    :datetime         not null

class User < ApplicationRecord
    has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

end




# an enrollment belongs to a student (student_id)
# an enrollment belongs to a course (course_id)
# a user has_many courses through enrollments
# a course has many users through enrollments