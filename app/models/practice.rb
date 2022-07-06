# frozen_string_literal: true

class Practice < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :duration, presence: true
  validates :practice_on, presence: true, uniqueness: { scope: :user_id }
end
