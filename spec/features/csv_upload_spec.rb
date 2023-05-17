# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Upload the csv file', type: :feature do
  before do
    admin = FactoryBot.create(:staff, :admin)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit students_path
    page.attach_file('file',
                     "#{Rails.root}/spec/features/test_file/Student module marks - MUST35 - MUS642 (60).csv")
    click_button 'Upload Students and Marks'
  end

  scenario 'successfully would show on students page' do
    expect(page).to have_content('Aqua')
  end

  scenario "successfully would show on main page without students' names" do
    visit '/'
    expect(page).to have_content('20230501')
    expect(page).to have_no_content('Aqua')
  end

  scenario 'successfully would raise notifications' do
    visit notifications_path
    expect(page).to have_content('New Programme added please update associated modules')
    expect(page).to have_content('New Module added please update accordingly')
  end
end
