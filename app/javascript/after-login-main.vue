<template>
  <div id="app">
    <YouTubeLoop @loop-done="createPracticeLog" />
    <PracticeCalendar :practices="practices" />
  </div>
</template>

<script>
import YouTubeLoop from './youtube-loop.vue'
import PracticeCalendar from './practice-calendar.vue'

export default {
  components: {
    YouTubeLoop,
    PracticeCalendar,
  },
  data() {
    return {
      data: null,
      practices: [],
    }
  },
  mounted() {
    this.fetchPractices()
  },
  methods: {
    token() {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    async fetchPractices() {
      fetch(`/api/practices.json`, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.token,
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
      await fetch('/api/practices', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.token(),
        },
        credentials: 'same-origin',
        redirect: 'manual',
        body: JSON.stringify(practiceLog),
      }).catch((error) => {
        console.error(error)
      })
      await this.fetchPractices()
    },
  },
}
</script>
