# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  before_action :login_required

  private

  def logged_in?
    !!current_user
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def current_user=(user)
    session[:user_id] = user.id
  end

  def login_required
    redirect_to welcome_url unless current_user
  end
end
