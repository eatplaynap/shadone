<template>
  <div id="app">
    <PracticeCalendar :practice-logs="practiceLogs" />
  </div>
</template>

<script>
import PracticeCalendar from './practice-calendar.vue'
import PracticeLogFetchable from './mixins/practice-log-fetchable'

export default {
  components: {
    PracticeCalendar,
  },
  mixins: [PracticeLogFetchable],
  mounted() {
    this.fetchPracticeLogs()
  },
}
</script>
