<template>
  <div id="app">
    <PracticeCalendar :practices="practices" />
  </div>
</template>

<script>
import PracticeCalendar from './practice-calendar.vue'
import PracticeFetchable from './mixins/practice-fetchable'

export default {
  components: {
    PracticeCalendar,
  },
  mixins: [PracticeFetchable],
  mounted() {
    this.fetchPractices()
  },
}
</script>
