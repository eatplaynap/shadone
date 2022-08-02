# frozen_string_literal: true

module YoutubeHelper
  def youtube_iframe_url(url)
    YouTubeRails.youtube_embed_url_only(url, ssl: true)
  end
end
