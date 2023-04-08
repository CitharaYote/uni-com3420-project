# == Schema Information
#
# Table name: students
#
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
end
