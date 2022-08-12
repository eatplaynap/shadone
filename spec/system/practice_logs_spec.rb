# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PracticeLogs', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:practice_log) {
    FactoryBot.create(:practice_log,
                      memo: 'Lorem ipsum dolor sit amet',
                      practice_on: Date.parse('2022-07-26'),
                      duration: 60,
                      user: user)
  }

  before do
    sign_in_as user
  end

  it 'can access practice log show page' do
    visit practice_log_path(practice_log)
    expect(page).to have_content '2022-07-26'
    expect(page).to have_content '1 minute'
    expect(page).to have_content 'Lorem ipsum dolor sit amet'
  end

  it 'can edit practice log' do
    visit practice_log_path(practice_log)
    click_on 'Add Memo'
    expect(page).to have_content '2022-07-26'
    expect(page).to have_content '1 minute'
    expect(page).to have_content 'Lorem ipsum dolor sit amet'
    fill_in 'Memo', with: 'Edit the practice log.'
    click_on 'Update'
    expect(page).to have_content 'Edit the practice log.'
  end
end
