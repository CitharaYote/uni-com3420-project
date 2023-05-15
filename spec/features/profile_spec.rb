require 'rails_helper'

RSpec.feature "Visit the profile page", type: :feature do
      scenario "with staff account" do
        staff = FactoryBot.create(:staff, :default)
        staff_user = FactoryBot.create(:user, username: staff.username)
        login_as(staff_user)
        visit profile_path
        expect(page).to have_content("false")
      end

      scenario "with admin account" do
        admin = FactoryBot.create(:staff, :admin)
        admin_user = FactoryBot.create(:user, username: admin.username)
        login_as(admin_user)
        visit profile_path
        expect(page).to have_content("true")
      end
end
