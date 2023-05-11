# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  flagged      :boolean
#  forename     :string
#  program_name :string
#  regID        :bigint           not null
#  status       :string
#  surname      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  program_id   :bigint
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:program){Program.create!}
  let(:student){Student.create!(regID:000000000, program_id:program.id)}
  let(:courses) do
    [
      Course.create!(credit:10, module_code:"TEST0"),
      Course.create!(credit:15, module_code:"TEST1"),
      Course.create!(credit:20, module_code:"TEST2")
    ]
  end
  before do
    CoursesProgram.create!(course_id: courses[0].id, program_id: program.id)
    CoursesProgram.create!(course_id: courses[1].id, program_id: program.id)
    CoursesProgram.create!(course_id: courses[2].id, program_id: program.id)
  end
  after do
    Mark.destroy_all
    Student.destroy_all
    Notification.destroy_all
    Program.destroy_all
    Course.destroy_all
  end

  describe '#student_total_credit' do
    it 'returns 25 with module 0,1 passed and 2 failed' do
      Mark.create!(student_id:student.id, course_id:courses[0].id, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[1].id, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[2].id, status:"F")
      expect(student.student_total_credit).to eq 25
    end

    it 'returns 0 with 3 failed module' do
      Mark.create!(student_id:student.id, course_id:courses[0].id, status:"F")
      Mark.create!(student_id:student.id, course_id:courses[1].id, status:"F")
      Mark.create!(student_id:student.id, course_id:courses[2].id, status:"F")
      expect(student.student_total_credit).to eq 0
    end
  end

  describe '#wmg_calculator' do
    it 'returns correct wmg with random value' do
      Mark.create!(student_id:student.id, course_id:courses[0].id, final_score:58, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[1].id, final_score:67, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[2].id, final_score:81, status:"P")
      expect(student.wmg_calculator.round(2)).to eq 71.22
    end
  end

  describe '#classification' do

    it 'set classification to First with wmg >= 70' do
      Mark.create!(student_id:student.id, course_id:courses[0].id, final_score:70, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[1].id, final_score:70, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[2].id, final_score:70, status:"P")
      expect(student.classification).to eq "First"
    end

    it 'set classification to Second with 60 <= wmg < 70' do
      Mark.create!(student_id:student.id, course_id:courses[0].id, final_score:60, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[1].id, final_score:60, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[2].id, final_score:60, status:"P")
      expect(student.classification).to eq "Second"
    end

    it 'set classification to Third with 50 <= wmg < 60' do
      Mark.create!(student_id:student.id, course_id:courses[0].id, final_score:50, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[1].id, final_score:50, status:"P")
      Mark.create!(student_id:student.id, course_id:courses[2].id, final_score:50, status:"P")
      expect(student.classification).to eq "Third"
    end

    it 'set classification to not attain full credit with wmg < 50' do
      Mark.create!(student_id:student.id, course_id:courses[0].id, final_score:40, status:"F")
      Mark.create!(student_id:student.id, course_id:courses[1].id, final_score:40, status:"F")
      Mark.create!(student_id:student.id, course_id:courses[2].id, final_score:40, status:"F")
      expect(student.classification).to eq "You didn't attain full credit"
    end
  end
end
