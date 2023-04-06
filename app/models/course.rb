# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  course_code :string           not null
#  credit      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
    has_and_belongs_to_many :programs, join_table: :courses_programs
    has_many :marks
    has_many :students, :through => :marks
end
