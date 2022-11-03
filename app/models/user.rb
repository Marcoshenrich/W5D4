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
    belongs_to :enrollment,
    primary_key: :id,
    foreign_key: :enrollment_id
    class_name: :Enrollment
end
