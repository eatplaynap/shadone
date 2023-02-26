import Vue from 'vue'
import App from './after-login-main.vue'

document.addEventListener('turbolinks:load', () => {
  const selector = '#js-after-login-main'
  const main = document.querySelector(selector)
  if (main) {
    const notice = main.getAttribute('data-notice')
    const userId = main.getAttribute('data-user-id')
    const doneImageUrl = main.getAttribute('data-done-image-url')
    const blankImageUrl = main.getAttribute('data-blank-image-url')
    new Vue({
      render: (h) =>
        h(App, {
          props: {
            notice: notice,
            userId: userId,
            doneImageUrl: doneImageUrl,
            blankImageUrl: blankImageUrl,
          },
        }),
    }).$mount(selector)
  }
})
