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
class Program < ApplicationRecord
    has_many :courses_programs
    has_many :courses, :through => :courses_programs
    
    has_many :students
    has_many :notifications
    #Calculates a program's total number of credits
    def program_total_credit
        total = 0
        courses = CoursesProgram.where(program_id: id)
        courses.each do |course|
            total += Course.find_by(id: course.course_id).credit
        end
        total
    end

end
