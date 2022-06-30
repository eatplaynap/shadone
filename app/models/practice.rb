# frozen_string_literal: true

class Practice < ApplicationRecord
  belongs_to :user
  validates :practice_on, presence: true, uniqueness: { scope: :user_id }
end
