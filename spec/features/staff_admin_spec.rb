require 'rails_helper'

RSpec.feature "Visit the staff page with admin account", type: :feature do
    let(:admin) {FactoryBot.create(:staff, :admin)}
    let(:admin_user) {FactoryBot.create(:user, username: admin.username)}
    
    before do
        login_as(admin_user)
        visit staffs_path
    end

    scenario "could see manage buttons" do
        expect(page).to have_content(admin_user.username)
        expect(page).to have_content("Edit")
        expect(page).to have_content("Remove")
    end

    scenario "could see staff editing page" do
        click_link "Edit"
        expect(page).to have_content("Save")
        expect(page).to have_content(admin_user.username)
        expect(page).to have_content("Back")
    end

    scenario "could back to staff page from editing page" do
        click_link "Edit"
        click_link "Back"
        expect(current_path).to eq(staffs_path)
    end

    scenario "could change staff details" do
        click_link "Edit"
        fill_in 'Username', with: 'test'
        click_button "Save"
        expect(page).to have_content("test")
    end
end