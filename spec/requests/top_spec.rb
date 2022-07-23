# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Top', type: :request do
  context 'as an authenticated user' do
    before do
      google_oauth_mock
    end

    it 'can access top page' do
      get '/auth/google_oauth2/callback'
      get root_path
      expect(response).to be_successful
    end
  end

  context 'as an unauthenticated user' do
    it 'cannot access top page' do
      get root_path
      expect(response).to redirect_to welcome_path
    end
  end
end
