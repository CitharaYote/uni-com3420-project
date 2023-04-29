# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  credit      :integer
#  module_code :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
    has_many :courses_programs
    has_many :programs, :through => :courses_programs
    
    has_many :marks
    has_many :students, :through => :marks

    has_many :notifications
end
