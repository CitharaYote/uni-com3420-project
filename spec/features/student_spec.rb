require 'rails_helper'

RSpec.feature 'Student Page', type: :feature do
  before do
    admin = FactoryBot.create(:staff, :admin)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit students_path
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST35 - MUS642 (60).csv")
    click_button 'Upload Marks'
  end

  scenario "User can upload csv" do
    expect(page).to have_content("20230501")
  end

  scenario "User can filter by module" do
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST50 - MUS650 (60).csv")
    click_button 'Upload Marks'
    expect(page).to have_content("20230519")
    select 'MUST35', from: 'program'
    click_button 'Filter'
    expect(page).not_to have_content("20230519")
  end

  scenario "User can create new student" do
    click_link 'New Student'
    fill_in 'student[forename]', with: "test"
    fill_in 'student[surname]', with: "test"
    fill_in 'student[regID]', with: "00000000"
    fill_in 'student[status]', with: "P"
    select "MUST35", from: 'student[program_id]'
    click_button 'Save'

    expect(page).to have_content("Showing")
    expect(page).to have_content("test")
  end

  scenario "User can access show page" do
    row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='20230501']]")
    show_button = row.find(:css, 'a', text: 'Show')
    show_button.click()
    expect(page).to have_content "Student Details"
    expect(page).to have_content "20230501"
  end

  scenario "User can edit a student's profile" do
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST50 - MUS650 (60).csv")
    click_button 'Upload Marks'
    row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='20230501']]")
    show_button = row.find(:css, 'a', text: 'Show')
    show_button.click()
    click_link 'Edit'
    fill_in 'student[forename]', with: 'TestRuth'
    fill_in 'student[surname]', with: "TestAqua"
    fill_in 'student[marks_attributes][0][fst_grade]', with: "83"
    click_button 'Save'
    expect(page).to have_content 'TestRuth'
    expect(page).to have_content 'TestAqua'
    expect(page).to have_content '83'
  end

#   scenario "User can remove exist students", js: true do
#     # need manual test
#     row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='20230501']]") # find the exact row
#     remove_button = row.find(:css, 'a', text: 'Remove')
#     accept_confirm("Are you Sure?")
#     expect(page).not_to have_content "20230501"
#   end
end
