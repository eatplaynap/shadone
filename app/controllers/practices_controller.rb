# frozen_string_literal: true

class PracticesController < ApplicationController
  def new; end

  def show
    @practice = Practice.find(params[:id])
  end

  def edit; end

  def destroy; end
end
