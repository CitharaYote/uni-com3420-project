require 'rails_helper'

RSpec.feature "Login the system", type: :feature do
      scenario "with non-staff account" do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in with: user.username
        fill_in with: user.password
        click_button "Log in"
        expect(page).to have_content("User is not a Staff")
      end

      #WIP
      #scenario "with admin account" do
      #  admin = FactoryBot.create(:staff, :admin)
      #  admin_user = FactoryBot.create(:user, :admin, username: admin.username)
      #  sign_in admin_user
      #  visit profile_path
      #  expect(page).to have_content("My")
      #end
end
