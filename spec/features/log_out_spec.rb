require 'rails_helper'

RSpec.feature "After login the system", type: :feature do
    before do
        admin = FactoryBot.create(:staff, :default)
        admin_user = FactoryBot.create(:user, username: admin.username)
        login_as(admin_user)
        visit '/'
    end    

    scenario "can see the log out botton" do
        expect(page).to have_content("Log out")
    end

    scenario "can log out through the log out botton" do
        click_link "Log out"
        expect(page).to have_content("Log in")
    end
end