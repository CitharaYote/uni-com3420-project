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
FactoryBot.define do
  factory :mark do
    
  end
end
