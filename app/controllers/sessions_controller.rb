# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.find_or_create_from_auth_hash!(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Successfully logged in!'
  end

  def destroy
    reset_session
    redirect_to welcome_path, notice: 'Successfully logged out!'
  end
end
