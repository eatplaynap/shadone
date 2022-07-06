# frozen_string_literal: true

module ApplicationHelper
  def seconds_in_words(seconds)
    ActiveSupport::Duration.build(seconds).inspect
  end
end
