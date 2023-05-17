# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  flagged      :boolean
#  forename     :string
#  program_name :string
#  regID        :bigint
#  status       :string
#  surname      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  program_id   :bigint
#
# Indexes
#
#  index_students_on_program_id  (program_id)
#
class Student < ApplicationRecord
  has_many :marks
  has_many :courses, through: :marks
  belongs_to :program

  accepts_nested_attributes_for :marks

  # weighted mean grade calculation for individual student
  # search courses by program
  # sum every mark multiplies by credit
  # and divide by total credits
  def wmg_calculator
    total_mark = 0
    total_credit = Student.find_by(id:).student_total_credit
    # find all courses connected to current student
    marks = Mark.where(student_id: id)
    marks.each do |mark|
      course = Course.find_by(id: mark.course_id)
      total_mark += course.credit * mark.final_score if mark.status == 'P' || mark.status == 'NA/P'
    end

    if total_credit != 0
      total_mark / student_total_credit
    else
      0
    end
  end

  # Calculates a student's total credit
  def student_total_credit
    total_credit = 0
    marks = Mark.where(student_id: id)
    marks.each do |mark|
      course = Course.find_by(id: mark.course_id)
      total_credit += course.credit if mark.status == 'P'
    end
    total_credit
  end

  # Calculates a student's degree classification
  def classification
    classification = ''
    program = Program.find_by(id: program_id)
    if student_total_credit == program.program_total_credit
      classification += "Master "
      if wmg_calculator > 70
        classification += "(Class one Honours)"
      elsif wmg_calculator > 60
        classification += "(Class two Honours)"
      else wmg_calculator > 50
        classification += "(Class three Honours)"
      end
    elsif student_total_credit >= 120
      classification = "Diploma (total credit: #{student_total_credit})"
    else
      classification = "Certificate (total credit: #{student_total_credit})"
    end
    
    classification
  end
end
