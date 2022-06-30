# frozen_string_literal: true

class Api::PracticesController < ApplicationController
  def index
    @practices = current_user.practices.order(:practice_on)
  end

  def create
    @practice = current_user.practices.find_or_initialize_by(practice_on: Time.zone.today)

    if @practice.update(practice_params)
      head :created
    else
      head :unprocessable_entity
    end
  end

  private

  def practice_params
    params.require(:practice).permit(:url, :duration)
  end
end
