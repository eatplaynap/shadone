<template>
  <div id="app">
    <YouTubeLoop @loop-done="createPracticeLog" />
    <PracticeCalendar :practices="practices" />
  </div>
</template>

<script>
import YouTubeLoop from './youtube-loop.vue'
import PracticeCalendar from './practice-calendar.vue'
import Vue from 'vue'
import VueToast from 'vue-toast-notification'
import 'vue-toast-notification/dist/theme-sugar.css'
import PracticeFetchable from './mixins/practice-fetchable'

Vue.use(VueToast)

export default {
  components: {
    YouTubeLoop,
    PracticeCalendar,
  },
  mixins: [PracticeFetchable],
  mounted() {
    this.fetchPractices()
  },
  methods: {
    createPracticeLog(practiceLog) {
      fetch('/api/practices', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.csrfToken(),
        },
        credentials: 'same-origin',
        redirect: 'manual',
        body: JSON.stringify(practiceLog),
      })
        .then(() => {
          this.$toast.success("Yey! You've created another practice log!")
          this.fetchPractices()
        })
        .catch(() => {
          this.$toast.error('Failed to create a new practice log!')
        })
    },
    csrfToken() {
      return document
        .querySelector('meta[name="csrf-token"]')
        ?.getAttribute('content')
    },
  },
}
</script>
