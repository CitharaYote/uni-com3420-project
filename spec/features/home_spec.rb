# frozen_string_literal: true

# Feature testing for the main page

require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  # before testing, log in as admin, upload two csv files
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
    click_link 'Edit'
    check 'MUS650'
    click_button 'Save'
    visit root_path
  end

  # test the search bar function
  scenario "User can search student by registration number" do
    fill_in "sid_search", with: "20230501\n"
    expect(page).not_to have_content('20230502')
    expect(page).to have_content('82.0')
  end

  #test the module list filter
  scenario "User can filter by module" do
    checkbox = find('input[type="checkbox"][value="MUS650"]')
    checkbox.check
    click_button 'Submit'
    expect(page).to have_no_content('MUS640')
  end
end
