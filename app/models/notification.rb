# == Schema Information
#
# Table name: notifications
#
#  id           :bigint           not null, primary key
#  source_name  :string
#  source_title :string
#  target_name  :string
#  target_title :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  program_id   :integer
#  user_id      :integer
#
class Notification < ApplicationRecord
end
