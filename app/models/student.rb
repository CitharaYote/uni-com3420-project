# == Schema Information
#
# Table name: students
#
#  regID      :bigint           not null
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < ApplicationRecord
    has_many :marks
    has_many :courses, :through => :marks
end
