require 'rails_helper'

RSpec.feature "Visit the profile page", type: :feature do
      scenario "can be done with the dropdown option" do
        staff = FactoryBot.create(:staff, :default)
        staff_user = FactoryBot.create(:user, username: staff.username)
        login_as(staff_user)
        visit '/'
        click_link "Profile"
        expect(page).to have_content("User Profile")
      end

      scenario "with staff account should see 'false' in section admin status" do
        staff = FactoryBot.create(:staff, :default)
        staff_user = FactoryBot.create(:user, username: staff.username)
        login_as(staff_user)
        visit profile_path
        expect(page).to have_content("false")
      end

      scenario "with admin account should see 'true' in section admin status" do
        admin = FactoryBot.create(:staff, :admin)
        admin_user = FactoryBot.create(:user, username: admin.username)
        login_as(admin_user)
        visit profile_path
        expect(page).to have_content("true")
      end
end
