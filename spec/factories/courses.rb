# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  credit      :integer
#  module_code :string           not null
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :course do
    
  end
end
