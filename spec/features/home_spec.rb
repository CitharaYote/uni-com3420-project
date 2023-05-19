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
    visit root_path
  end

  scenario "User can search student by registration number" do
    fill_in "sid_search", with: "20230501\n"
    expect(page).not_to have_content('20230502')
    expect(page).to have_content('82.0')
  end

  scenario "User can filter by module" do
    check 'MUS642'
    click_button "Submit"
    expect(page).to have_content("MUST35")
  end

  scenario "User can print the table" do
    find("#print_button").click
    expect(page).to have_content("Printer")
  end
end
