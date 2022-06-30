# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome', type: :system do
  let(:user) { FactoryBot.create(:user) }

  it 'can log in' do
    sign_in_as user
    expect(page).to have_content 'Logout'
  end

  it 'can log out' do
    sign_in_as user
    click_link 'Logout'

    expect(page).to have_content 'Login'
  end

  it 'cannot access / when user was not logged in' do
    visit root_path
    expect(page).to have_content 'Login'
  end

  it 'can access / when user was logged in' do
    sign_in_as user
    visit root_path
    expect(page).to have_content 'Calendar'
  end
end
