# == Schema Information
#
# Table name: current_users
#
#  id         :bigint           not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :current_user do
    username { "MyString" }
    email { "MyString" }
  end
end
