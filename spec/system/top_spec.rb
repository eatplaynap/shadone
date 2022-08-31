# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Top', type: :system do
  let(:user) { FactoryBot.create(:user) }

  it 'creates a new practice log and enables to access its show page when loop ended' do
    sign_in_as user
    expect(page).to have_no_link Date.current.day.to_s
    fill_in 'url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g'
    fill_in 'start-minute', with: 1
    fill_in 'start-second', with: 1
    fill_in 'end-minute', with: 1
    fill_in 'end-second', with: 2
    fill_in 'loop-count', with: 3
    click_on 'Start'
    expect(page).to have_button 'Quit'
    sleep 5
    expect(page).to have_button 'Start'
    expect(page).to have_content "Yey! You've created another practice log!"
    expect(page).to have_link Date.current.day.to_s
  end

  it 'enables a user to quit practicing middle of the loop and create a new practice log' do
    sign_in_as user
    expect(page).to have_no_link Date.current.day.to_s
    fill_in 'url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g'
    fill_in 'start-minute', with: 1
    fill_in 'start-second', with: 1
    fill_in 'end-minute', with: 1
    fill_in 'end-second', with: 2
    fill_in 'loop-count', with: 10
    click_on 'Start'
    sleep 1
    click_on 'Quit'
    expect(page).to have_button 'Start'
    expect(page).to have_content "Yey! You've created another practice log!"
    expect(page).to have_link Date.current.day.to_s
  end

  it "creates a practice log on today's date when a user in Tokyo starts a loop at AM12(JST)" do
    today = Time.current.in_time_zone('Tokyo')
    # travels to 00:00 midnight JST(= 15:00 UTC)
    travel_to("#{today.year}-#{today.month}-#{today.day} 00:00") do
      sign_in_as user
      expect(page).to have_no_link today.day.to_s
      fill_in 'url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g'
      fill_in 'start-minute', with: 1
      fill_in 'start-second', with: 1
      fill_in 'end-minute', with: 1
      fill_in 'end-second', with: 2
      fill_in 'loop-count', with: 3
      click_on 'Start'
      expect(page).to have_button 'Quit'
      sleep 5
      expect(page).to have_button 'Start'
      expect(page).to have_content "Yey! You've created another practice log!"
      expect(page).to have_link today.day.to_s
      expect(page).to have_no_link today.yesterday.day.to_s
    end
  end
end
