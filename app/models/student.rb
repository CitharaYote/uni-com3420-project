# == Schema Information
#
# Table name: students
#
#  regID      :bigint           not null
#  status     :string
#  t_credit   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :bigint
#
class Student < ApplicationRecord
    has_many :marks
    has_many :courses, :through => :marks
end
