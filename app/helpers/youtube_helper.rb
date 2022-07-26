# frozen_string_literal: true

module YoutubeHelper
  def youtube_iframe_url(url)
    YouTubeRails.youtube_embed_url_only(url, ssl: true)
  end

  def youtube_thumbnail_url(url)
    YouTubeRails.extract_video_image(url)
  end
end
