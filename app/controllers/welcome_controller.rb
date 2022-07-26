# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :login_required
  before_action :not_login_required

  def index; end

  private

  def not_login_required
    redirect_to root_path if logged_in?
  end
end
