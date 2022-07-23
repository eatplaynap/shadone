# frozen_string_literal: true

module GoogleOauthMockHelper
  def google_oauth_mock
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] =
      OmniAuth::AuthHash.new({ provider: 'google_oauth2', uid: Faker::Internet.uuid, info: { name: Faker::Name.name, image_url: Faker::Avatar.image } })
  end
end
