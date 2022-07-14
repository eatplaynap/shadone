# frozen_string_literal: true

class PracticesController < ApplicationController
  def new; end

  def show
    @practice = current_user.practices.find(params[:id])
  end

  def edit
    @practice = current_user.practices.find(params[:id])
  end

  def update
    practice = current_user.practices.find(params[:id])
    practice.update!(practice_params)
    redirect_to practice_url, notice: "Updated practice of #{practice.practice_on}"
  end

  private

  def practice_params
    params.require(:practice).permit(:memo)
  end
end
