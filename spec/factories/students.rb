# == Schema Information
#
# Table name: students
#
#  regID      :bigint           not null
#  status     :string
#  t_credit   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :bigint
#
FactoryBot.define do
  factory :student do
    regID { "MyString" }
    status { "MyString" }
  end
end
