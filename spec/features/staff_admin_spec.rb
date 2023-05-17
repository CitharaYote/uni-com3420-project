require 'rails_helper'

RSpec.feature "Visit the staff page with admin account", type: :feature do
    scenario "could see manage buttons" do
        admin = FactoryBot.create(:staff, :admin)
        admin_user = FactoryBot.create(:user, username: admin.username)
        login_as(admin_user)
        visit staffs_path
        expect(page).to have_content(admin_user.username)
        expect(page).to have_content("Edit")
        expect(page).to have_content("Remove")
    end
end