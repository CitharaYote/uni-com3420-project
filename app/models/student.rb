# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  regID      :bigint           not null
#  status     :string
#  t_credit   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :bigint
#
# Indexes
#
#  index_students_on_program_id  (program_id)
#
class Student < ApplicationRecord
    has_many :marks
    has_many :courses, :through => :marks
    belongs_to :program
end
