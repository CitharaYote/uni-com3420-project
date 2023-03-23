# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  module_mark  :integer
#  reg_no       :integer
#  total_credit :integer
#  wmg          :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :student do
    regID { "MyString" }
    status { "MyString" }
  end
end
