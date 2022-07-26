# frozen_string_literal: true

class PracticeLog < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :duration, presence: true
  validates :practice_on, presence: true, uniqueness: { scope: :user_id }

  def previous
    user.practice_logs.where('practice_on < ?', practice_on).order(:practice_on).last
  end

  def next
    user.practice_logs.where('practice_on > ?', practice_on).order(:practice_on).first
  end
end
