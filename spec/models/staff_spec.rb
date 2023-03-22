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
require 'rails_helper'

RSpec.describe Staff, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
