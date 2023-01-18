# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sessions", type: :system do
  let(:user) { FactoryBot.create(:user) }

  it "can log in" do
    sign_in_as user
    expect(page).to have_content "Successfully logged in!"
  end

  it "can log out" do
    sign_in_as user
    click_link "Logout"
    expect(page).to have_content "Successfully logged out!"
  end
end
