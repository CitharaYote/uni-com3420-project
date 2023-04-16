# == Schema Information
#
# Table name: programs
#
#  id           :bigint           not null, primary key
#  program_name :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Program, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
