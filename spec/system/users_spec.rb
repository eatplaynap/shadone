# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :system do
  let(:user) { FactoryBot.create(:user) }

  it 'can show their profile page' do
    sign_in_as user
    click_on 'Profile'
    expect(page).to have_content 'Your Profile'
  end

  it 'can delete their account' do
    sign_in_as user
    click_on 'Profile'
    accept_confirm { click_on 'Delete Account' }
    expect(page).to have_content 'Successfully deleted your account!'
  end
end
