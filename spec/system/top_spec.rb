# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Top', type: :system do
  let(:user) { FactoryBot.create(:user) }

  it 'can do loop' do
    sign_in_as user
    fill_in('url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g')
    fill_in('start-minute', with: 1)
    fill_in('start-second', with: 1)
    fill_in('end-minute', with: 1)
    fill_in('end-second', with: 2)
    fill_in('loop-count', with: 3)
    click_on('Start')
    sleep 5
    has_text?('0')
  end

  it 'can create a new practice log when loop ended' do
    sign_in_as user
    fill_in('url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g')
    fill_in('start-minute', with: 1)
    fill_in('start-second', with: 1)
    fill_in('end-minute', with: 1)
    fill_in('end-second', with: 2)
    fill_in('loop-count', with: 3)
    click_on('Start')
    sleep 5
    has_text?("Yey! You've created another practice log!")
  end

  it 'can access a practice show page when a new practice log was created' do
    sign_in_as user
    fill_in('url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g')
    fill_in('start-minute', with: 1)
    fill_in('start-second', with: 1)
    fill_in('end-minute', with: 1)
    fill_in('end-second', with: 2)
    fill_in('loop-count', with: 3)
    click_on('Start')
    sleep 5
    scroll_to(:bottom)
    date_of_today = Time.zone.today.day.to_s
    click_on(date_of_today)
    has_text?('Memo')
  end

  it 'can stop middle of the loop and create a practice log' do
    sign_in_as user
    fill_in('url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g')
    fill_in('start-minute', with: 1)
    fill_in('start-second', with: 1)
    fill_in('end-minute', with: 1)
    fill_in('end-second', with: 2)
    fill_in('loop-count', with: 10)
    click_on('Start')
    sleep 1
    click_on('Quit')
    has_text?("Yey! You've created another practice log!")
  end
end
