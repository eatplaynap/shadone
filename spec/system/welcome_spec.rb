# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome', type: :system do
  it 'can do loop' do
    visit welcome_path
    fill_in 'url', with: 'https://www.youtube.com/watch?v=s3ZX2RX73_g'
    fill_in 'start-minute', with: 1
    fill_in 'start-second', with: 1
    fill_in 'end-minute', with: 1
    fill_in 'end-second', with: 2
    fill_in 'loop-count', with: 3
    click_on 'Start'
    expect(page).to have_button('Quit')
    sleep 10
    expect(page).to have_button('Start')
  end
end
