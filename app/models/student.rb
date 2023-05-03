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

        wmg / total_credit
        
    end
end
