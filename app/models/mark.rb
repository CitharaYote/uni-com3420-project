# == Schema Information
#
# Table name: marks
#
#  course_code :string
#  mark        :integer
#  regID       :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint
#  student_id  :bigint
#
# Indexes
#
#  index_marks_on_course_code_and_regID  (course_code,regID)
#  index_marks_on_course_id              (course_id)
#  index_marks_on_regID_and_course_code  (regID,course_code)
#  index_marks_on_student_id             (student_id)
#
class Mark < ApplicationRecord
    belongs_to :student
    belongs_to :course
end
