# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :login_required

  def index
    redirect_to root_path if logged_in?
  end
end
