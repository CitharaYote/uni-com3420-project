# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
