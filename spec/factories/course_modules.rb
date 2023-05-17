# frozen_string_literal: true

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
FactoryBot.define do
  factory :course_module do
    moduleCode { 'MyString' }
    credit { 'MyString' }
  end
end
