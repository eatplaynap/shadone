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
    redirect_to practice_url, notice: "Updated practice#{practice.id}"
  end

  def destroy; end

  private

  def practice_params
    params.require(:practice).permit(:url, :duration, :memo)
  end

end
