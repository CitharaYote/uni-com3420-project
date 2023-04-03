# == Schema Information
#
# Table name: programs
#
#  program_name :string           primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :program do
    program_code { "MyString" }
  end
end
