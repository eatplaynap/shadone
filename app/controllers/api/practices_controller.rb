# frozen_string_literal: true

class Api::PracticesController < ApplicationController
  def index
    @practices = Practice.where(user_id: 2).order('practice_on')
  end

  def create
    @practice = Practice.find_or_initialize_by(practice_params)

    if @practice.save
      head :created
    else
      render json: @practice.errors, status: :unprocessable_entity
    end
  end

  private

  def practice_params
    params.require(:practice).permit(:user_id, :practice_id, :url, :duration, :practice_on)
  end
end
