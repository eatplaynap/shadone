# frozen_string_literal: true

class PracticesController < ApplicationController
  def new; end

  def show
    @practice = Practice.find(params[:id])
  end

  def edit
    @practice = Practice.find(params[:id])
  end

  def update
    practice = Practice.find(params[:id])
    practice.update!(practice_params)
    redirect_to practice_url, notice: "Updated practice of #{practice.practice_on}"
  end

  def destroy
    practice = Practice.find(params[:id])
    practice.destroy
    redirect_to root_path, notice: "Deleted practice of #{practice.practice_on}"
  end

  private

  def practice_params
    params.require(:practice).permit(:url, :duration, :memo)
  end

end
