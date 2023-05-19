# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Login with staff account', type: :feature do
  let(:staff) { FactoryBot.create(:staff, :default) }
  let(:staff_user) { FactoryBot.create(:user, username: staff.username) }

  scenario 'should not see the staff page link' do
    login_as(staff_user)
    visit '/'
    expect(page).to have_no_content('Staff')
  end
end
