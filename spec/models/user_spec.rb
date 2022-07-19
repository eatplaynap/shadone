# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe '.find_or_create_from_auth_hash!' do
  end

  describe '#total_practice_duration' do
    it 'returns total duration if a user created a practice' do
      practice1 = user.practices.create(
        url: 'test_url',
        duration: 100,
        practice_on: Time.zone.today
      )

      practice2 = user.practices.create(
        url: 'test_url',
        duration: 300,
        practice_on: Time.zone.today - 1
      )
      expect(user.total_practice_duration).to eq 400
    end

    it 'returns 0 if a user has not created a practice' do
      expect(user.total_practice_duration).to eq 0
    end
  end
end
