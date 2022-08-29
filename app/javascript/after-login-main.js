import Vue from 'vue'
import App from './after-login-main.vue'

document.addEventListener('turbolinks:load', () => {
  const selector = '#js-after-login-main'
  const main = document.querySelector(selector)
  if (main) {
    const notice = main.getAttribute('data-notice')
    const user_id = main.getAttribute('data-user-id')
    new Vue({
      render: (h) =>
        h(App, {
          props: {
            notice: notice,
            user_id: user_id,
          },
        }),
    }).$mount(selector)
  }
})
