require 'rails_helper'

RSpec.feature 'Notification Page', type: :feature do
  before do
    admin = FactoryBot.create(:staff, :admin)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit students_path
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST35 - MUS642 (60).csv")
    click_button 'Upload Marks'
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST50 - MUS650 (60).csv")
    click_button 'Upload Marks'
    visit notifications_path
  end

  scenario "User can visit newly created programme page" do
    row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='New Programme added please update associated modules']]")
    show_button = row.find(:css, 'a', text: 'Show MUST35')
    show_button.click()
    expect(page).to have_content("Programme Details")
    expect(page).to have_content("MUST35")
  end

  scenario "User can visit newly created module page" do
    row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='Create new course(MUS642)']]")
    show_button = row.find(:css, 'a', text: 'Show MUS642')
    show_button.click()
    expect(page).to have_content("Course Details")
    expect(page).to have_content("MUS642")
  end
end
