# == Schema Information
#
# Table name: courses
#
#  course_code :string           not null
#  credit      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
    self.primary_key = "course_code"
    has_many :marks
    has_many :students, :through => :marks
end
