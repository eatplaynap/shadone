# frozen_string_literal: true

class Api::PracticesController < ApplicationController
  def index
    @practices = current_user.practices.order(:practice_on)
  end

  def create
    @practice = current_user.practices.find_or_initialize_by(practice_params)
    @practice.user_id = current_user.id

    if @practice.save
      head :created
    else
      render json: @practice.errors, status: :unprocessable_entity
    end
  end

  private

  def practice_params
    params.require(:practice).permit(:practice_id, :url, :duration, :practice_on)
  end
end
