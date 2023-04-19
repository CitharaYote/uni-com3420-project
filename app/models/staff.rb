# == Schema Information
#
# Table name: staffs
#
#  id         :bigint           not null, primary key
#  is_admin   :boolean
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Staff < ApplicationRecord
    validates  :username, :format => {with: /\A[a-zA-Z0-9]+\z/, message: "Usernames should only have characters from A-z and 0-9. Example: aca21kj"}
    validates :is_admin, :inclusion => {in: [true, false], message: "Admin validation error. Please report this bug."}
    
end
