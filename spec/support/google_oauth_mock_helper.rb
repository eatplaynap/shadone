# frozen_string_literal: true

module GoogleOauthMockHelper
  def google_oauth_mock
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(Faker::Omniauth.google)
  end
end
