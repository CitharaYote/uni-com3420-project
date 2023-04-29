# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  alert      :string
#  identifier :string
#  isModule   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  program_id :integer
#
# Indexes
#
#  index_notifications_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class Notification < ApplicationRecord
    belongs_to :course, optional: true
    belongs_to :program, optional: true
end
