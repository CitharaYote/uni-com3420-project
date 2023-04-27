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
require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
