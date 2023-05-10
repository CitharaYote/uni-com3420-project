# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  credit      :integer
#  module_code :string           not null
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
    has_many :courses_programs
    has_many :programs, :through => :courses_programs
    
    has_many :marks
    has_many :students, :through => :marks

    has_many :notifications
    validates :module_code, :format => {with: /\A[a-zA-Z0-9]+\z/, message: "should only have characters from A-z and 0-9. Example: COM2009"}
    validates :credit, :length => {:minimum => 1, :message => " field empty,"}
    #Makes a notiication when a course is created
    after_create do |course|
        Notification.create!(identifier: course.module_code, alert: "Create new course(#{course.module_code})", isModule: true, course_id: course.id)
    end

    #Makes a notification when a course is updated
    after_update do |course|
        Notification.create!(identifier: course.module_code, alert: "Update course(#{course.module_code})", isModule: true, course_id: course.id)
    end
end
