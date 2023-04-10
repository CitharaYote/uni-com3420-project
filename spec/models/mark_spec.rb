# == Schema Information
#
# Table name: marks
#
#  fst_grade  :bigint
#  scd_grade  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_marks_on_course_id   (course_id)
#  index_marks_on_student_id  (student_id)
#
require 'rails_helper'

RSpec.describe Mark, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
