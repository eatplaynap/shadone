# frozen_string_literal: true

require "rails_helper"

RSpec.describe PracticeLog, type: :model do
  let(:practice_log) { FactoryBot.create(:practice_log) }

  describe "#previous" do
    it "returns previous practice log" do
      previous_practice_log = FactoryBot.create(:practice_log, practice_on: practice_log.practice_on.yesterday, user: practice_log.user)
      expect(practice_log.previous).to eq previous_practice_log
    end

    it "returns nil without previous practice log" do
      expect(practice_log.previous).to eq nil
    end
  end

  describe "#next" do
    it "returns next practice log" do
      next_practice_log = FactoryBot.create(:practice_log, practice_on: practice_log.practice_on.tomorrow, user: practice_log.user)
      expect(practice_log.next).to eq next_practice_log
    end

    it "returns nil without next practice log" do
      expect(practice_log.next).to eq nil
    end
  end
end
