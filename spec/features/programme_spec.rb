require 'rails_helper'

RSpec.feature 'Programme Page', type: :feature do
  before do
    admin = FactoryBot.create(:staff, :admin)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit students_path
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST35 - MUS642 (60).csv")
    click_button 'Upload Marks'
    page.attach_file('file',"#{Rails.root}/spec/features/test_file/Student module marks - MUST50 - MUS650 (60).csv")
    click_button 'Upload Marks'
    visit programs_path
  end

  scenario "User can create new program" do
    click_link 'New Programme'
    fill_in 'program[program_name]', with: 'TESTPROGRAM'
    fill_in 'program[title]', with: 'TESTTITLE'
    check 'MUS642'
    check 'MUS650'
    click_button 'Save'
    expect(page).to have_content("TESTPROGRAM")
  end

  scenario "User can search by programme name" do
    expect(page).to have_content("MUST50")
    fill_in 'search[program_name]', with: 'MUST35'
    click_button 'Search'
    expect(page).not_to have_content("MUST50")
    click_link 'Reset'
    expect(page).to have_content("MUST50")
  end

  scenario "User can access programme profile" do
    row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='\nMUST35\n']]")
    show_button = row.find(:css, 'a', text: 'Show')
    show_button.click()
    expect(page).to have_content("Programme Details")
  end

  scenario "User can edit programme profile" do
    expect(page).not_to have_content ("TESTTITLE")
    row = page.find(:xpath, ".//tr[./td[@class='px-4 py-2 border'][text()='\nMUST35\n']]")
    edit_button = row.find(:css, 'a', text: 'Edit')
    edit_button.click()
    fill_in 'program[title]',with: "TESTTITLE"
    click_button 'Save'
    expect(page).to have_content ("TESTTITLE")
  end
  
end
