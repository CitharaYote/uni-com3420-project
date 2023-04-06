# == Schema Information
#
# Table name: programs
#
#  id           :bigint           not null
#  program_code :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Program < ApplicationRecord
    has_and_belongs_to_many :courses
end
