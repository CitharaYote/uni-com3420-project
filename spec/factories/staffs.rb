# == Schema Information
#
# Table name: staffs
#
#  id         :bigint           not null, primary key
#  is_admin   :boolean
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :staff do
    username { "MyString" }
    is_admin { false }
  end
end
