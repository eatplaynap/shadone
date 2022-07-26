# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PracticeLog', type: :request do
  before do
    google_oauth_mock
  end

  context 'as an authenticated user' do

    before do
      get '/auth/google_oauth2/callback'
    end

    it 'can create a practice log' do
      expect {
        post api_practice_logs_path, params: {
          practice_log: {
            url: 'https://www.youtube.com/watch?v=s3ZX2RX73_g',
            duration: 300
          }
        }
      }.to change(PracticeLog, :count).from(0).to(1)
      expect(response).to have_http_status(:created)
    end

    it 'can update a practice log' do
      post api_practice_logs_path, params: {
        practice_log: {
          url: 'https://www.youtube.com/watch?v=s3ZX2RX73_g',
          duration: 300
        }
      }
      expect {
        post api_practice_logs_path, params: {
          practice_log: {
            url: 'https://www.youtube.com/watch?v=A51rPtHYKrk',
            duration: 100
          }
        }
      }.to_not change(PracticeLog, :count)
      expect(response).to have_http_status(:created)
    end
  end

  context 'as an unauthenticated user' do
    it 'cannot create a practice log' do
      expect {
        post api_practice_logs_path, params: {
          practice: {
            url: 'https://www.youtube.com/watch?v=s3ZX2RX73_g',
            duration: 300
          }
        }
      }.to_not change(PracticeLog, :count)
      expect(response).to have_http_status(:found)
    end
  end
end
