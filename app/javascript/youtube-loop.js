import Vue from 'vue'
import App from './youtube-loop.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-youtube-loop'
  const youtubeLoop = document.querySelector(selector)
  if (youtubeLoop) {
    const app = new Vue({
      render: (h) => h(App),
    }).$mount(selector)
    document.body.appendChild(app.$el)
  }
})
