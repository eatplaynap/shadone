# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Top', type: :request do
  include GoogleOauthMockHelper

  context 'as an authenticated user' do
    before do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      Rails.application.env_config['omniauth.auth'] = google_oauth_mock
    end

    it 'can access top page' do
      get '/auth/google_oauth2/callback'
      get root_path
      expect(response).to have_http_status '200'
      expect(response).to be_successful
    end
  end

  context 'as a non-authenticated user' do
    it 'cannot access top page' do
      get root_path
      expect(response).to have_http_status '302'
      expect(response).to redirect_to welcome_path
    end
  end
end
