# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  before do
    @today = Practice.create(user: user, url: 'test_url', duration: 100, practice_on: Time.zone.today)
  end

  describe '#previous' do
    it 'returns previous date from today' do
      yesterday = Practice.create(user: user, url: 'test_url', duration: 100, practice_on: Time.zone.yesterday)
      expect(@today.previous).to eq yesterday
    end
  end

  describe '#next' do
    it 'returns next date from today' do
      tomorrow = Practice.create(user: user, url: 'test_url', duration: 100, practice_on: Time.zone.tomorrow)
      expect(@today.next).to eq tomorrow
    end
  end
end
