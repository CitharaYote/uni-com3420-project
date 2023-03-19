# == Schema Information
#
# Table name: programs
#
#  id          :bigint           not null, primary key
#  programCode :string
#  programName :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :program do
    programName { "MyString" }
  end
end
