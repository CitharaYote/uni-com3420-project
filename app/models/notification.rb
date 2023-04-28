# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  alert      :string
#  identifier :string
#  isModule   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :integer
#
class Notification < ApplicationRecord
end
