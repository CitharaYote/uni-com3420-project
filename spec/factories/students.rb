# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  flagged      :boolean
#  forename     :string
#  program_name :string
#  regID        :bigint           not null
#  status       :string
#  surname      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  program_id   :bigint
#
FactoryBot.define do
  factory :student do
    regID { "MyString" }
    status { "MyString" }
  end
end
