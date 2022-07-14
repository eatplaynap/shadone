# frozen_string_literal: true

class Practice < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :duration, presence: true
  validates :practice_on, presence: true, uniqueness: { scope: :user_id }

  def previous
    Practice.where(user: user).where('practice_on < ?', practice_on).order(practice_on: :desc).first
  end

  def next
    Practice.where(user: user).where('practice_on > ?', practice_on).order(:practice_on).first
  end
end
