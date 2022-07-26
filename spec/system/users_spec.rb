# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { FactoryBot.create(:user, name: 'Test User') }
  let(:practice_log) { FactoryBot.create(:practice_log, user: user, duration: 60) }

  before do
    @practiced_date = practice_log.practice_on.day.to_s
  end

  it 'can access their profile page' do
    sign_in_as user
    click_on 'Profile'
    expect(page).to have_content 'Test User'
    expect(page).to have_content 'Total Practice Duration'
    expect(page).to have_content 'Su Mo Tu We Th Fr Sa'
  end

  it 'can access a practice log show page from a calendar' do
    sign_in_as user
    click_on 'Profile'
    click_on @practiced_date
    expect(page).to have_content '1 minute'
    expect(page).to have_content 'Edit'
  end

  it 'can delete their account' do
    sign_in_as user
    click_on 'Profile'
    accept_confirm { click_on 'Delete Account' }
    expect(page).to have_content 'Successfully deleted your account!'
  end
end
