import Vue from 'vue'
import App from './youtube-loop.vue'

document.addEventListener('turbolinks:load', () => {
  const selector = '#js-youtube-loop'
  const youTubeLoop = document.querySelector(selector)
  if (youTubeLoop) {
    new Vue({ render: (h) => h(App) }).$mount(selector)
  }
})
