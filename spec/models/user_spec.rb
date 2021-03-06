# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe '.find_or_create_from_auth_hash!' do
    it 'returns a user object if a record exists' do
      auth_hash = { provider: user.provider, uid: user.uid, info: { name: user.name, image_url: user.image_url } }
      expect(User.find_or_create_from_auth_hash!(auth_hash)).to eq user
      expect { User.find_or_create_from_auth_hash!(auth_hash) }.to_not(change { User.count })
    end

    it 'creates a new user if a record does not exist' do
      new_user = FactoryBot.build(:user)
      new_user_auth_hash = { provider: new_user.provider, uid: new_user.uid, info: { name: new_user.name, image_url: new_user.image_url } }
      expect { User.find_or_create_from_auth_hash!(new_user_auth_hash) }.to change { User.count }.from(0).to(1)
    end

    it 'returns an error if an invalid argument is passed' do
      auth_hash = { provider: user.provider, uid: nil, info: { name: user.name, image_url: user.image_url } }
      expect { User.find_or_create_from_auth_hash!(auth_hash) }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe '#total_practice_duration' do
    it 'returns total duration if a user created a practice' do
      FactoryBot.create(:practice, duration: 300, practice_on: Time.zone.today, user: user)
      FactoryBot.create(:practice, duration: 100, practice_on: Time.zone.yesterday, user: user)

      expect(user.total_practice_duration).to eq 400
    end

    it 'returns 0 if a user has not created a practice' do
      expect(user.total_practice_duration).to eq 0
    end
  end
end
