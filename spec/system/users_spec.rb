# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { FactoryBot.create(:user, name: 'Test User') }
  let!(:practice_log) { FactoryBot.create(:practice_log, user: user, duration: 60) }

  before do
    sign_in_as user
  end

  it 'can delete their account' do
    accept_confirm { click_on 'Delete Account' }
    expect(page).to have_content 'Successfully deleted your account!'
  end
end
