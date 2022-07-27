# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :login_required
  before_action :not_login_required, only: [:index]

  def index; end

  def tos; end

  def privacy_policy; end

  private

  def not_login_required
    redirect_to root_path if logged_in?
  end
end
