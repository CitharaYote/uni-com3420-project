# == Schema Information
#
# Table name: programs
#
#  id           :bigint           not null, primary key
#  program_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Program < ApplicationRecord
    has_many :courses_programs
    has_many :courses, :through => :courses_programs
    
    has_many :students
end
