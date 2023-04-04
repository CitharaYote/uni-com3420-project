# == Schema Information
#
# Table name: students
#
#  program_name :string
#  regID        :bigint           not null
#  status       :string
#  t_credit     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Student < ApplicationRecord
    has_many :marks
    has_many :courses, :through => :marks
    belongs_to :program, foreign_key: 'program_name', primary_key: 'program_name'
end
