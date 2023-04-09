# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  forename     :string
#  program_name :string
#  regID        :bigint           not null
#  status       :string
#  surname      :string
#  t_credit     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  program_id   :bigint
#
# Indexes
#
#  index_students_on_program_id  (program_id)
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
