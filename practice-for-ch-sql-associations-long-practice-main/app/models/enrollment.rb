# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  student_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    validates :student_id, uniqueness:{scope: :course_id}

    belongs_to :course,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Course

    belongs_to :student,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :User


    #if a table contains a foreign key referencing another table, it is a belongs to association
    # the foreign key in the association should match
    # belongs_to is singular, #has_many is plural



end
