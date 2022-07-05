# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  has_many :practices, dependent: :destroy

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = name
      user.image_url = image_url
    end
  end

  def total_practice_duration
    practices.map(&:duration).sum || 0
  end
end
