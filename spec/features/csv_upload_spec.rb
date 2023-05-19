# frozen_string_literal: true

# Feature testing for csv upload function

require 'rails_helper'

RSpec.feature 'Upload the csv file', type: :feature do
  # before testing, log in as admin, visit student page and upload the file
  before do
    admin = FactoryBot.create(:staff, :admin)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit students_path
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST35 - MUS642 (60).csv")
    click_button 'Upload Marks'
  end

  # test if it shows the students on the student page after uploading
  scenario 'successfully would show on students page' do
    expect(page).to have_content('Aqua')
  end

  # test if it shows the data without students' names on the main page after uploading
  scenario "successfully would show on main page without students' names" do
    visit '/'
    expect(page).to have_content('20230501')
    expect(page).to have_no_content('Aqua')
  end

  # test if it raises notifications as new students, modules and programs are uploaded
  scenario 'successfully would raise notifications' do
    visit notifications_path
    expect(page).to have_content('New Programme added please update associated modules')
    expect(page).to have_content('New Module added please update accordingly')
  end
end
