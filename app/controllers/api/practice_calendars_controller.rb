class Api::PracticeCalendarsController < ApplicationController
  def show
    @practices = Practice.where(user_id: 1)
  end
end
