# frozen_string_literal: true

class User < ApplicationRecord
  has_many :practice_logs, dependent: :destroy
  validates :name, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  validates :image_url, presence: true

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    image_url = auth_hash[:info][:image]

    find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = name
      user.image_url = image_url
    end
  end

  def total_practice_duration
    practice_logs.sum(:duration)
  end
end
