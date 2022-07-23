# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:practice) { FactoryBot.create(:practice) }

  describe '#previous' do
    it 'returns previous practice' do
      previous_practice = FactoryBot.create(:practice, practice_on: practice.practice_on.yesterday, user: practice.user)
      expect(practice.previous).to eq previous_practice
    end

    it 'returns nil without previous practice' do
      expect(practice.previous).to eq nil
    end
  end

  describe '#next' do
    it 'returns next practice' do
      next_practice = FactoryBot.create(:practice, practice_on: practice.practice_on.tomorrow, user: practice.user)
      expect(practice.next).to eq next_practice
    end

    it 'returns nil without next practice' do
      expect(practice.next).to eq nil
    end
  end
end
