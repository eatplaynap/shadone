# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome', type: :request do
  context 'as a non-logged-in user' do
    it 'can access welcome page' do
      get welcome_path
      expect(response).to have_http_status(:ok)
    end
  end

  context 'as a logged-in user' do
    before do
      google_oauth_mock
      get '/auth/google_oauth2/callback'
    end

    it 'cannot access welcome page' do
      get welcome_path
      expect(response).to redirect_to root_path
    end
  end
end
