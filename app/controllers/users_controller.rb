# frozen_string_literal: true

class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def destroy
    current_user.destroy
    reset_session
    redirect_to welcome_path, notice: 'Successfully deleted your account!'
  end

end
