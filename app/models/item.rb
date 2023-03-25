# == Schema Information
#
# Table name: items
#
#  name       :string           not null, primary key
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
end
