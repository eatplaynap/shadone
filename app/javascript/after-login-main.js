import Vue from 'vue'
import App from './after-login-main.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-main'
  const main = document.querySelector(selector)
  if (main) {
    new Vue({ render: (h) => h(App) }).$mount(selector)
  }
})
