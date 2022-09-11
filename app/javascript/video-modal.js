import Vue from 'vue'
import App from './video-modal.vue'

document.addEventListener('turbolinks:load', () => {
  const selector = '#js-video-modal'
  const editForm = document.querySelector(selector)
  if (editForm) {
    new Vue({
      render: (h) => h(App),
    }).$mount(selector)
  }
})
