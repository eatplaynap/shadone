# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome', type: :system do
  it 'can do loop', js: true do
    visit welcome_path
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
end
