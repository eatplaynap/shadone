# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Practices', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:practice) { FactoryBot.create(:practice, user: user) }

  it 'can edit a practice log' do
    sign_in_as user
    visit practice_path(practice)
    click_on('Edit')
    fill_in('Memo', with: 'Edit the practice.')
    click_on('Update Practice')
    expect(page).to have_content('Edit the practice.')
  end
end
