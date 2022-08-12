import Cookies from 'js-cookie'

Cookies.set(
  'browser.timezone',
  Intl.DateTimeFormat().resolvedOptions().timeZone,
  { expires: 365 }
)
