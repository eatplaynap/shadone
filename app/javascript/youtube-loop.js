import Vue from 'vue'
import App from './youtube-loop.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: (h) => h(App),
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
