# == Schema Information
#
# Table name: students
#
#  program_name :string
#  regID        :bigint           not null
#  status       :string
#  t_credit     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
