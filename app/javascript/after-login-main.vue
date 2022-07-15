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
import PracticeFetchable from "./mixins/practice-fetchable";

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
    async fetchPractices() {
      fetch(`/api/practices.json`, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
        },
        credentials: 'same-origin',
      })
        .then((response) => {
          return response.json()
        })
        .then((json) => {
          json.forEach((r) => {
            this.practices.push(r)
          })
        })
        .catch((error) => {
          console.warn(error)
        })
    },
    async createPracticeLog(practiceLog) {
      this.$toast.success("Yey! You've created another practice log!")
      await fetch('/api/practices', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.csrfToken(),
        },
        credentials: 'same-origin',
        redirect: 'manual',
        body: JSON.stringify(practiceLog),
      }).then(() => {
        this.$toast.success("Yey! You've created another practice log!")
        this.fetchPractices()
      }).catch(() => {
        this.$toast.error("Failed to create a new practice log!")
      })
      await this.fetchPractices()
    },
    csrfToken() {
      return document.querySelector('meta[name="csrf-token"]')?.getAttribute('content')
    },
  },
}
</script>
