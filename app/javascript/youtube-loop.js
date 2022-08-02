import Vue from 'vue'
import App from './youtube-loop.vue'

document.addEventListener('turbolinks:load', () => {
  const selector = '#js-youtube-loop'
  const youTubeLoop = document.querySelector(selector)
  if (youTubeLoop) {
    const notice = youTubeLoop.getAttribute('data-notice')
    new Vue({
      render: (h) =>
        h(App, {
          props: { notice: notice },
        }),
    }).$mount(selector)
  }
})
