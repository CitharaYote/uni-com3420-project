# frozen_string_literal: true

# Feature testing for staff page with staff authority

require 'rails_helper'

RSpec.feature 'Login with staff account', type: :feature do
  # before testing, log in as a staff
  let(:staff) { FactoryBot.create(:staff, :default) }
  let(:staff_user) { FactoryBot.create(:user, username: staff.username) }

  # test if staff can see the staff page link
  scenario 'should not see the staff page link' do
    login_as(staff_user)
    visit '/'
    expect(page).to have_no_content('Staff')
  end
end
