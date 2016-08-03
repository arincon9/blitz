require 'rails_helper'

RSpec.feature "Users can visit home page" do
	scenario "visits root path" do
		visit "/"

		expect(page).to have_content "Blitz a Friend"
	end
end
