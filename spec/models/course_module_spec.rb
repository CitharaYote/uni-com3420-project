# == Schema Information
#
# Table name: course_modules
#
#  id         :bigint           not null, primary key
#  credit     :integer
#  moduleCode :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CourseModule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
