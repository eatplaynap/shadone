<template>
  <div id="app">
    <PracticeCalendar :practices="practices" />
  </div>
</template>

<script>
import PracticeCalendar from './practice-calendar.vue'

export default {
  components: {
    PracticeCalendar,
  },
  data() {
    return {
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
    fetchPractices() {
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
  },
}
</script>
