# frozen_string_literal: true

class Api::PracticeCalendarsController < ApplicationController
  def show
    @practices = Practice.where(user_id: 1).order('practice_on')
  end
end
