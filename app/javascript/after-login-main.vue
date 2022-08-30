<template>
  <div id="app">
    <YouTubeLoop @loop-done="createPracticeLog" />
    <PracticeCalendar :practice-logs="practiceLogs" />
    <div class="text-xl mt-2 text-primary" >
      You have practiced for {{ totalPracticeDuration }} in total.
    </div>
  </div>
</template>

<script>
import YouTubeLoop from './youtube-loop.vue'
import PracticeCalendar from './practice-calendar.vue'
import Vue from 'vue'
import VueToast from 'vue-toast-notification'
import 'vue-toast-notification/dist/theme-sugar.css'
import PracticeLogFetchable from './mixins/practice-log-fetchable'

Vue.use(VueToast)

export default {
  components: {
    YouTubeLoop,
    PracticeCalendar,
  },
  mixins: [PracticeLogFetchable],
  props: {
    notice: { type: String, default: null, required: false },
    user_id: { type: String, default: null, required: true },
  },
  mounted() {
    this.fetchPracticeLogs()
    this.displayNotice()
    this.getTotalPracticeDuration()
  },
  data() {
    return {
      totalPracticeDuration: null,
    }
  },
  methods: {
    createPracticeLog(practiceLog) {
      fetch('/api/practice_logs', {
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
          this.fetchPracticeLogs()
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
    displayNotice() {
      if (this.notice) {
        this.$toast.success(this.notice, {
          position: 'top-left',
        })
      }
    },
    getTotalPracticeDuration() {
      fetch(`/api/users/${this.user_id}.json`, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
        },
        credentials: 'same-origin',
      })
          .then((response) => {
            return response.json()
          })
          .then((user) => {
            this.totalPracticeDuration = user.total_practice_duration
            return
          })
    }
  },
}
</script>
