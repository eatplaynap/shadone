# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PracticeLogs', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:practice_log) { FactoryBot.create(:practice_log, user: user) }

  it 'can edit a practice log' do
    sign_in_as user
    visit practice_log_path(practice_log)
    click_on('Edit')
    fill_in('Memo', with: 'Edit the practice log.')
    click_on('Update Practice log')
    expect(page).to have_content('Edit the practice log.')
  end
end
