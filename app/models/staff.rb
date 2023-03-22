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
class Staff < ApplicationRecord
end
