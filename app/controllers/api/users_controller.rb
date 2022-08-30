# frozen_string_literal: true

class API::UsersController < ApplicationController
  def show
    @total_practice_duration = current_user.total_practice_duration
  end
end
