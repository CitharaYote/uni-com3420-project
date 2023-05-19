# frozen_string_literal: true

# Feature testing for log out function

require 'rails_helper'

RSpec.feature 'After login the system', type: :feature do
  # before testing, log in as admin
  before do
    admin = FactoryBot.create(:staff, :default)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit '/'
  end

  # test for correctly displaying the log out button
  scenario 'can see the log out botton' do
    expect(page).to have_content('Log Out')
  end

  # test for if the log out brings user to the login page
  scenario 'can log out through the log out botton' do
    click_link 'Log Out'
    expect(page).to have_content('Log In')
  end
end
