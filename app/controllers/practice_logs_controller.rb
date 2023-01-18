# frozen_string_literal: true

class PracticeLogsController < ApplicationController
  def new
  end

  def show
    @practice_log = current_user.practice_logs.find(params[:id])
  end

  def update
    practice_log = current_user.practice_logs.find(params[:id])
    practice_log.update!(practice_log_params)
  end

  private

  def practice_log_params
    params.require(:practice_log).permit(:memo)
  end
end
