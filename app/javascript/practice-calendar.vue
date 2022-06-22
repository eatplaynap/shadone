<template>
  <div id="practiceCalendar">
    <div @click="previousMonth">Previous Month</div>
    <div>{{ calendarYear }} - {{ calendarMonth }}</div>
    <div v-if="!newestMonth()" @click="nextMonth">Next Month</div>
    <table>
      <thead>
        <tr>
          <th>Su</th>
          <th>Mo</th>
          <th>Tu</th>
          <th>We</th>
          <th>Th</th>
          <th>Fr</th>
          <th>Sa</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="week in calendarWeeks" :key="week.id">
          <td
            v-for="date in week.value"
            :key="date.weekDay"
            :class="[practiceMarkClass(date), todayClass(date)]"
          >
            {{ date.date }}
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    dataFromYouTube: { type: Array },
  },
  data() {
    return {
      practices: this.dataFromYouTube || [],
      currentYear: this.getCurrentYear(),
      currentMonth: this.getCurrentMonth(),
      calendarYear: this.getCurrentYear(),
      calendarMonth: this.getCurrentMonth(),
      today: this.getCurrentDay(),
    }
  },
  computed: {
    calendarPractices() {
      return this.practices.filter((practice) =>
        practice.practice_on.includes(
          `${this.calendarYear}-${this.formatMonth(this.calendarMonth)}`
        )
      )
    },
    firstWday() {
      const firstDay = new Date(this.calendarYear, this.calendarMonth - 1, 1)
      return firstDay.getDay()
    },
    lastDate() {
      const lastDay = new Date(this.calendarYear, this.calendarMonth, 0)
      return lastDay.getDate()
    },
    calendarDates() {
      const calendar = []
      if (this.firstWday > 0) {
        for (let blank = 0; blank < this.firstWday; blank++) {
          calendar.push(null)
        }
      }
      for (let date = 1; date <= this.lastDate; date++) {
        const result = this.calendarPractices.find(
          (practice) => this.practiceDate(practice) === date
        )
        if (result) {
          result.date = date
          calendar.push(result)
        } else {
          calendar.push({ date: date })
        }
      }
      return calendar
    },
    calendarWeeks() {
      const weeksAry = []
      let value = []
      let id = 1
      let weekDay = 0
      this.calendarDates.forEach(function (date, i, ary) {
        !date ? (date = { weekDay: weekDay }) : (date.weekDay = weekDay)
        value.push(date)
        weekDay++
        if (value.length === 7 || i === ary.length - 1) {
          weeksAry.push({ id: id, value: value })
          id++
          value = []
          weekDay = 0
        }
      })
      return weeksAry
    },
  },
  mounted() {
    this.getPracticeData()
  },
  watch: {
    dataFromYouTube: function () {
      this.getPracticeData()
    }
  },
  methods: {
    getPracticeData() {
      fetch(`/api/practice_calendars/1.json`, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.token(),
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
    token() {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    previousMonth() {
      if (this.calendarMonth === 1) {
        this.calendarMonth = 12
        this.calendarYear--
      } else {
        this.calendarMonth--
      }
    },
    nextMonth() {
      if (this.calendarMonth === 12) {
        this.calendarMonth = 1
        this.calendarYear++
      } else {
        this.calendarMonth++
      }
    },
    practiceMarkClass(date) {
      return date.practice_on ? 'practice-done' : 'practice-none'
    },
    todayClass(date) {
      if (
        this.calendarYear !== this.currentYear ||
        this.calendarMonth !== this.currentMonth
      )
        return
      if (date.date === this.today) return 'is-today'
    },
    newestMonth() {
      return (
        this.currentYear === this.calendarYear &&
        this.currentMonth === this.calendarMonth
      )
    },
    getCurrentYear() {
      return new Date().getFullYear()
    },
    getCurrentMonth() {
      return new Date().getMonth() + 1
    },
    getCurrentDay() {
      return new Date().getDate()
    },
    practiceDate(practice) {
      return Number(practice.practice_on.split('-')[2])
    },
    formatMonth(month) {
      return month.toString().padStart(2, '0')
    },
  },
}
</script>

<style>
/*delete when time comes*/

.is-today {
  color: red;
}
.practice-done {
  background-color: yellow;
}

</style>
