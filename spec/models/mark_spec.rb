# == Schema Information
#
# Table name: marks
#
#  mark       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  student_id :bigint
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
