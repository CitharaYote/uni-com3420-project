# == Schema Information
#
# Table name: programs
#
#  program_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Program < ApplicationRecord
    has_and_belongs_to_many :courses
end
