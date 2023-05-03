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
class Student < ApplicationRecord
    has_many :marks
    has_many :courses, :through => :marks
    belongs_to :program

    # weighted mean grade calculation for individual student
    # search courses by program
    # sum every mark multiplies by credit
    # and divide by total credits
    def wmg_calculator 
        wmg = 0
        total_credit = 0
        #find all courses connected to current student
        marks = Mark.where(student_id: id)
        marks.each do |mark| 
            course = Course.find_by(id: mark.course_id)
            wmg += course.credit * mark.final_score
            total_credit += course.credit
        end

        if total_credit != 0
            wmg / total_credit
        else
            0
        end
        
    end

    # def wmg_calculation_detail (program)
    #     mark_list = []
    #     credit_list = []
    #     # marks = Mark.where(student_id: id)
    #     # marks.each do |mark|
    #     #     mark_list.push(mark.final_score)
    #     # end
    #     courses_program = CoursesProgram.where(program_id: program)
    #     courses_program.each do |c_p|
    #         credit = Course.find_by(id: c_p.course_id).credit
    #         credit_list.push(credit)
    #         mark = Mark.find_by(student_id: id, course_id: c_p.course_id).final_score
    #         mark_list.push(mark)
    #     end

    #     puts mark_list[0]
    # end

end
