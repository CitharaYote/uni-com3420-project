# == Schema Information
#
# Table name: programs
#
#  program_name :string           primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Program < ApplicationRecord
    self.primary_key = "program_name"
    has_and_belongs_to_many :courses, join_table: :programs_courses
end
