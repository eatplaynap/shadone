# frozen_string_literal: true

module ApplicationHelper
  def seconds_in_words(seconds)
    ActiveSupport::Duration.build(seconds).inspect
  end

  def embeddable_youtube_url(url)
    YouTubeRails.youtube_embed_url_only(url)
  end
end
