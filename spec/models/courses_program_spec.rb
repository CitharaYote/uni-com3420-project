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
require 'rails_helper'

RSpec.describe CoursesProgram, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
