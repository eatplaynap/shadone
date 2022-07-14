# frozen_string_literal: true
# 学習記録の編集・削除
describe 'practice', type: :system do

  it 'has a valid factory' do
    expect(FactoryBot.build(:practice)).to be_valid
  end
end
