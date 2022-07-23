# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Practice', type: :request do
  before do
    google_oauth_mock
  end

  context 'as an authenticated user' do
    it 'can create a practice' do
      get '/auth/google_oauth2/callback'
      post api_practices_path, params: {
        practice: {
          url: 'https://www.youtube.com/watch?v=s3ZX2RX73_g',
          duration: 300
        }
      }
      expect(response).to have_http_status(201)
    end

    it 'can update a practice' do
      get '/auth/google_oauth2/callback'
      post api_practices_path, params: {
        practice: {
          url: 'https://www.youtube.com/watch?v=s3ZX2RX73_g',
          duration: 300
        }
      }
      expect do
        post api_practices_path, params: {
          practice: { url: 'https://www.youtube.com/watch?v=A51rPtHYKrk', duration: 100 }
        }
      end.to_not(change { Practice.count })
    end
  end

  context 'as an unauthenticated user' do
    it 'cannot create a practice' do
      post api_practices_path, params: {
        practice: {
          url: 'https://www.youtube.com/watch?v=s3ZX2RX73_g',
          duration: 300
        }
      }
      expect(response).to have_http_status(302)
    end
  end
end
