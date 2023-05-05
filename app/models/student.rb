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
        total_mark = 0
        total_credit = Student.find_by(id: id).student_total_credit
        wmg = 0
        #find all courses connected to current student
        marks = Mark.where(student_id: id)
        marks.each do |mark| 
            course = Course.find_by(id: mark.course_id)
            if mark.status == "P"
                total_mark += course.credit * mark.final_score
            end
        end

        if total_credit != 0
            wmg = total_mark / total_credit
        else
            wmg = 0
        end
        
        wmg
    end

    def student_total_credit
        total_credit = 0
        marks = Mark.where(student_id: id)
        marks.each do |mark|
            course = Course.find_by(id: mark.course_id)
            if mark.status == "P"
                total_credit += course.credit
            end
        end
        total_credit
    end

end
