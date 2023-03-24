# == Schema Information
#
# Table name: students
#
#  regID      :bigint           not null
#  status     :string
#  t_credit   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :bigint
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
