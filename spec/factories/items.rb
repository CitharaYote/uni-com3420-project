# == Schema Information
#
# Table name: items
#
#  name       :string           not null, primary key
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :item do
    name { "MyString" }
    value { 1 }
  end
end
