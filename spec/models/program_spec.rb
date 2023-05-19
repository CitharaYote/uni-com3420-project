# frozen_string_literal: true

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
  # create test instances
  let(:program) { Program.create! }
  let(:courses) do
    [
      Course.create!(credit: 10, module_code: 'TEST0'),
      Course.create!(credit: 15, module_code: 'TEST1'),
      Course.create!(credit: 20, module_code: 'TEST2')
    ]
  end
  before do
    CoursesProgram.create!(course_id: courses[0].id, program_id: program.id)
    CoursesProgram.create!(course_id: courses[1].id, program_id: program.id)
    CoursesProgram.create!(course_id: courses[2].id, program_id: program.id)
  end
  # clear up
  after do
    Notification.destroy_all
    Program.destroy_all
    Course.destroy_all
  end

  # program_total_credit function
  describe '#program_total_credit' do
    it 'returns correct credit with random credit courses' do
      expect(program.program_total_credit).to eq 45
    end
  end
end
