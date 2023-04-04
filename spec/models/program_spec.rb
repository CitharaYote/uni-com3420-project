# == Schema Information
#
# Table name: programs
#
#  program_name :string           primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_programs_on_program_name  (program_name) UNIQUE
#
require 'rails_helper'

RSpec.describe Program, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
