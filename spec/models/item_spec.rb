# == Schema Information
#
# Table name: items
#
#  name       :string           not null, primary key
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
