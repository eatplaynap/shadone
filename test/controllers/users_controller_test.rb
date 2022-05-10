# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get users_show_url
    assert_response :success
  end

  test 'should get edit' do
    get users_edit_url
    assert_response :success
  end

  test 'should get destroy' do
    get users_destroy_url
    assert_response :success
  end
end
