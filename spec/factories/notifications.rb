# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  alert      :string
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :integer
#
FactoryBot.define do
  factory :notification do
    
  end
end
