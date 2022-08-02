import Vue from 'vue'
import App from './edit-form.vue'

document.addEventListener('turbolinks:load', () => {
  const selector = '#js-edit-form'
  const editForm = document.querySelector(selector)
  if (editForm) {
    const practiceLogId = Number(editForm.getAttribute('data-practice-log-id'))
    new Vue({
      render: (h) =>
        h(App, {
          props: {
            practiceLogId: practiceLogId,
          },
        }),
    }).$mount(selector)
  }
})
