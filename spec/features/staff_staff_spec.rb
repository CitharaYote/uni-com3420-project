require 'rails_helper'

RSpec.feature "Visit the staff page with staff account", type: :feature do
    let(:staff) {FactoryBot.create(:staff, :default)}
    let(:staff_user) {FactoryBot.create(:user, username: staff.username)}

    before do
        login_as(staff_user)
        visit staffs_path
    end

    scenario "could only read" do
        expect(page).to have_content(staff_user.username)
        expect(page).to have_no_content("Edit")
        expect(page).to have_no_content("Remove")
    end
end