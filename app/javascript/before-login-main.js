import Vue from 'vue'
import App from './before-login-main.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-before-login-main'
  const beforeLoginMain = document.querySelector(selector)
  if (beforeLoginMain) {
    new Vue({ render: (h) => h(App) }).$mount(selector)
  }
})
