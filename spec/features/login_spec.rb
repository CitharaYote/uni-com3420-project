# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Login the system', type: :feature do
  scenario 'with non-staff account' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in with: user.username
    fill_in with: user.password
    click_button 'Log In'
    expect(page).to have_content('User is not a Staff')
  end

  scenario 'with staff account' do
    staff = FactoryBot.create(:staff, :default)
    staff_user = FactoryBot.create(:user, username: staff.username)
    login_as(staff_user)
    visit '/'
    expect(page).to have_content('WMG Calculator')
  end

  scenario 'with admin account' do
    admin = FactoryBot.create(:staff, :admin)
    admin_user = FactoryBot.create(:user, username: admin.username)
    login_as(admin_user)
    visit '/'
    expect(page).to have_content('WMG Calculator')
  end
end
