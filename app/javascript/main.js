import Vue from 'vue'
import App from './main.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-main'
  const main = document.querySelector(selector)
  if (main) {
    const practiceCalendar = new Vue({
      render: (h) => h(App),
    }).$mount(selector)
    document.body.appendChild(main.$el)
  }
})
