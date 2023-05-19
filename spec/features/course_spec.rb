require 'rails_helper'

RSpec.feature 'Course Page', type: :feature do
  before do
    admin = FactoryBot.create(:staff, :admin)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit students_path
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST35 - MUS642 (60).csv")
    click_button 'Upload Marks'
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST50 - MUS650 (60).csv")
    click_button 'Upload Marks'
    visit courses_path
  end

  scenario "User can filter by programme" do
    expect(page).to have_content('MUS650')
    select 'MUST35', from: 'program'
    click_button 'Filter'
    expect(page).not_to have_content('MUS650')
  end

  scenario "User can create new module" do
    click_link 'New Module'
    fill_in 'course[module_code]', with: 'TEST'
    fill_in 'course[credit]', with: '10'
    click_button 'Save'
    expect(page).to have_content("TEST")
  end

  scenario "User can search by module code" do
    expect(page).to have_content("MUS650")
    fill_in 'search[module_code]', with: 'MUS642'
    click_button 'Search'
    expect(page).not_to have_content("MUS650")
    click_link 'Reset'
    expect(page).to have_content("MUS650")
  end

  scenario "User can access module profile" do
    row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='\nMUS642\n']]")
    show_button = row.find(:css, 'a', text: 'Show')
    show_button.click()
    expect(page).to have_content("Course Detail")
  end

  scenario "User can edit module profile" do
    expect(page).to have_content ("UPDATE CREDIT VALUE")
    row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='\nMUS650\n']]")
    edit_button = row.find(:css, 'a', text: 'Edit')
    edit_button.click()
    fill_in 'course[credit]',with: 30
    click_button 'Save'
    expect(page).not_to have_content ("UPDATE CREDIT VALUE")
  end
end
