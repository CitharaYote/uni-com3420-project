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
    has_and_belongs_to_many :courses, foreign_key: "program_name", association_foreign_key: "course_code", join_table: :courses_programs
end
