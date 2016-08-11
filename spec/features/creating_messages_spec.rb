require 'rails_helper'

RSpec.feature "Messages" do
	before do
		visit root_path
		click_link "Blitz a Friend"
	end

	scenario "user can create messages" do
		click_button "Send Blitz!"
		expect(:alert).to be_present

		fill_in "Name", with: "Alex"
		fill_in "Phone number", with: "8001234567"
		fill_in "Images", with: "Penguins"
		click_button "Send Blitz!"

		expect(:notice).to be_present
	end
end
