# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Top', type: :system do

  it 'can do loop', js: true do
    user = FactoryBot.create(:user)
    sign_in_as user
    expect(page).to have_content 'Successfully logged in!'
  end

  it 'ループしたら学習記録ができて日付がハイライトされる' do

  end

  it '学習記録ができていれば詳細ページにアクセスできる' do

  end

  it '一時停止できる' do

  end
end
