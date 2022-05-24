import Vue from 'vue'
import App from './loop.vue'

// Vue.config.productionTip = false
//
// new Vue({
//   render: h => h(Loop),
// }).$mount('#loop')

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
