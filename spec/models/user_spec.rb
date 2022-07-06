# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  describe '.find_or_create_from_auth_hash!' do

  end

  describe '#total_practice_duration' do
    # あるユーザーに対するプラクティスが作成されていたらそのdurationの合計をテスト
    # なにもないときは0
  end
end
