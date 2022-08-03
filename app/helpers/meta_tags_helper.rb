# frozen_string_literal: true

module MetaTagsHelper
  def default_meta_tags
    {
      site: 'Shadone',
      description: 'Shadone; the app helps you do shadowing exercise with YouTube videos!',
      keywords: %w[Shadone Shadowing YouTube English],
      charset: 'utf-8',
      canonical: 'https://shadone.herokuapp.com/welcome',
      og: {
        title: 'Shadone',
        type: 'website',
        site_name: 'Shadone',
        description: :description,
        image: image_url('ogp.png'),
        url: 'https://shadone.herokuapp.com/welcome'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@eatplaynap329'
      }
    }
  end
end
