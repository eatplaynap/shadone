<template>
  <div id="app">
    <YouTubeLoop @custom-event="fetchData" />
    <PracticeCalendar :data-from-you-tube="practices"/>
  </div>
</template>

<script>
import YouTubeLoop from './youtube-loop.vue'
import PracticeCalendar from './practice-calendar.vue'

export default {
  components: {
    YouTubeLoop,
    PracticeCalendar },
  data() {
    return {
      data: null,
      practices: [],
    }
  },
  methods: {
    token() {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    fetchData() {
      fetch(`/api/practice_calendars/1.json`, {
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
    }
  }
}
</script>
