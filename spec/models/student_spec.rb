# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  module_mark  :integer
#  reg_no       :integer
#  total_credit :integer
#  wmg          :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
