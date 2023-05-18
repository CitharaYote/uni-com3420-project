# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visit the staff page with admin account', type: :feature do
  let(:admin) { FactoryBot.create(:staff, :admin) }
  let(:admin_user) { FactoryBot.create(:user, username: admin.username) }

  before do
    login_as(admin_user)
    visit '/'
    click_link 'Staff'
  end

  scenario 'could see manage buttons' do
    expect(page).to have_content(admin_user.username)
    expect(page).to have_content('Edit')
    expect(page).to have_content('Remove')
  end

  scenario 'could see staff editing page' do
    click_link 'Edit'
    expect(page).to have_content('Save')
    expect(page).to have_content(admin_user.username)
    expect(page).to have_content('Back')
  end

  scenario 'could back to staff page from editing page' do
    click_link 'Edit'
    click_link 'Back'
    expect(current_path).to eq(staffs_path)
  end

  scenario 'could change staff admin status' do
    click_link 'Edit'
    uncheck 'Administrator'
    click_button 'Save'
    click_link 'Back'
    expect(page).to have_no_content('Edit')
    expect(page).to have_no_content('Remove')
  end

  scenario 'could add a new staff' do
    click_link 'New Staff'
    fill_in 'Username', with: 'elb20ym'
    check 'Administrator'
    click_button 'Save'
    click_link 'Log Out'
    new_user = FactoryBot.create(:user, username: 'elb20ym')
    login_as(new_user)
    visit '/'
    click_link 'Staff'
    expect(page).to have_content('Edit')
    expect(page).to have_content('Remove')
  end
end
