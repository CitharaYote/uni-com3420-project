# == Schema Information
#
# Table name: programs
#
#  id           :bigint           not null, primary key
#  program_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :program do
    program_code { "MyString" }
  end
end
