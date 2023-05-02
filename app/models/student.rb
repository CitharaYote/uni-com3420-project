# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  forename     :string
#  mean_grade   :integer
#  program_name :string
#  regID        :bigint           not null
#  status       :string
#  surname      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  program_id   :bigint
#
class Student < ApplicationRecord
    has_many :marks
    has_many :courses, :through => :marks
    belongs_to :program

    def wmg_calculator
        wmg = 0
        total_credit = 0
        courses_programs = CoursesProgram.where(program_id: program_id)
        courses_programs.each do |c_p|
            mark = Mark.find_by(course_id: c_p.course_id, student_id: id).fst_grade
            credit = Course.find_by(id: c_p.course_id).credit
            wmg += credit * mark
            total_credit += credit
        end

        wmg / total_credit
        
    end
end
