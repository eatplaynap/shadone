# frozen_string_literal: true

module SignInHelper
  def sign_in_as(user)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
      user.provider,
      uid: user.uid,
      info: { name: user.name,
              image: user.image_url }
    )
    visit welcome_path
    click_link 'Login'
  end
end
