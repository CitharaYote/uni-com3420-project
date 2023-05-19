# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
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

  scenario "User can search student by registration number" do
    fill_in "sid_search", with: "20230501\n"
    expect(page).not_to have_content('20230502')
    expect(page).to have_content('82.0')
  end

  scenario "User can filter by module" do
    checkbox = find('input[type="checkbox"][value="MUS650"]')
    checkbox.check
    click_button 'Submit'
    expect(page).to have_no_content('MUS640')
  end

  #WIP
  scenario "User can filter by programme" do
    select('MUST35', from: 'ProgramThing[PrgmSelect]')
    expect(page).to have_no_content('MUST50')
  end

  #WIP
  scenario "User can click on elements in the main table to see more information" do
    find(:xpath, ".//tr[contains(./td[@class='px-4 py-2 border hover:bg-gray-200 transition cursor-pointer'], '20230501')]").click()
    save_page("/home/morepp/project/screenshot/t.html")
    expect(page).to have_css('.fixed.w-2/3')
  end
end
