# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  before do
    admin = FactoryBot.create(:staff, :admin)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit students_path
    page.attach_file('file',
                     "#{Rails.root}/spec/features/test_file/Student module marks - MUST35 - MUS642 (60).csv")
    click_button 'Upload Students and Marks'
    visit root_path
  end

  scenario 'User can search student by registration number' do
    find('input#sid_search', wait: 5)
    fill_in 'sid_search', with: '20230501'
    find('input#sid_search').send_keys(:enter)
    expect(page).not_to have_content('20230502')
    expect(page).to have_content('82.0')
  end
end
