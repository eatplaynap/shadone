# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { FactoryBot.create(:user, name: 'Test User') }
  let!(:practice_log) { FactoryBot.create(:practice_log, user: user, duration: 60) }

  before do
    sign_in_as user
  end

  it 'can access their profile page' do
    find('.dropdown.dropdown-end').click
    click_on 'Profile'
    expect(page).to have_content 'Test User'
    expect(page).to have_content '1 minute'
    expect(page).to have_link practice_log.practice_on.day.to_s, href: practice_log_path(practice_log)
  end

  it 'can delete their account' do
    find('.dropdown.dropdown-end').click
    click_on 'Profile'
    accept_confirm { click_on 'Delete Account' }
    expect(page).to have_content 'Successfully deleted your account!'
  end
end
