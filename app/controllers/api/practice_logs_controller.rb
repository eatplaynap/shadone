# frozen_string_literal: true

class API::PracticeLogsController < ApplicationController
  around_action :use_time_zone, only: [:create]

  def index
    @practice_logs = current_user.practice_logs.order(:practice_on)
  end

  def create
    @practice_log = current_user.practice_logs.find_or_initialize_by(practice_on: Date.current)

    if @practice_log.update(practice_log_params)
      head :created
    else
      head :unprocessable_entity
    end
  end

  def show
    @practice_log = current_user.practice_logs.find(params[:id])
  end

  private

  def practice_log_params
    params.require(:practice_log).permit(:url, :duration)
  end

  def use_time_zone(&action)
    Time.use_zone(Time.find_zone(cookies["browser.timezone"].presence) || Time.zone, &action)
  end
end
