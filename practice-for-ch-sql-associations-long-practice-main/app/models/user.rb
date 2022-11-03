# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

    has_many :courses,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :Course
    
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment,
        dependent: :destroy 

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

    #the source calls the method in the associated belongs_to record
end