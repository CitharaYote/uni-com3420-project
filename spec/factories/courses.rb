# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  course_code :string           not null
#  credit      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :course do
    
  end
end
