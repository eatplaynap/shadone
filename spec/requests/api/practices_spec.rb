# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Practice', type: :request do
  include GoogleOauthMockHelper

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Rails.application.env_config['omniauth.auth'] = google_oauth_mock
  end

  it 'POST practice' do
    get '/auth/google_oauth2/callback'
    practice = FactoryBot.create(:practice)
    post api_practices_path, params: {
      practice: {
        url: practice.url,
        duration: practice.duration
      }
    }
    expect(response).to have_http_status(201)
  end
end
