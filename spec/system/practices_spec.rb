# frozen_string_literal: true

require 'rails_helper'

describe 'practice', type: :system do
  let(:user) { FactoryBot.create(:user) }

  it 'can edit a practice log' do
    sign_in_as user
    fill_in('url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g')
    fill_in('start-minutes', with: 1)
    fill_in('start-seconds', with: 1)
    fill_in('end-minutes', with: 1)
    fill_in('end-seconds', with: 2)
    fill_in('loop-count', with: 3)
    click_on('Start')
    sleep 5
    scroll_to(:bottom)
    date_of_today = Time.zone.today.day.to_s
    click_on(date_of_today)
    click_on('Edit')
    fill_in('Memo', with: 'Editing the practice.')
    click_on('Update Practice')
    has_text?('Editing the practice.')
  end
end
