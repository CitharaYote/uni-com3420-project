# == Schema Information
#
# Table name: courses_programs
#
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#  program_id :bigint           not null
#
# Indexes
#
#  index_courses_programs_on_course_id   (course_id)
#  index_courses_programs_on_program_id  (program_id)
#
class CoursesProgram < ApplicationRecord
    belongs_to :course
    belongs_to :program
end
