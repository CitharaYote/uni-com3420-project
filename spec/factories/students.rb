# == Schema Information
#
# Table name: students
#
#  program_name :string
#  regID        :bigint           not null
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :student do
    regID { "MyString" }
    status { "MyString" }
  end
end
