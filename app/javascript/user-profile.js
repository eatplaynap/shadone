import Vue from 'vue'
import App from './user-profile.vue'

document.addEventListener('turbolinks:load', () => {
  const selector = '#js-user-profile'
  const userProfile = document.querySelector(selector)
  if (userProfile) {
    new Vue({ render: (h) => h(App) }).$mount(selector)
  }
})
