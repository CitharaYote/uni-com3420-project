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
    has_and_belongs_to_many :programs
end
