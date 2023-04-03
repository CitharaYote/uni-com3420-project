# == Schema Information
#
# Table name: courses
#
#  course_code :string           not null, primary key
#  credit      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
    self.primary_key = "course_code"
    has_and_belongs_to_many :programs, join_table: :programs_courses
    has_many :marks
    has_many :students, :through => :marks
end
