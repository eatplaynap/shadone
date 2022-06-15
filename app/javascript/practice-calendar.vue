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
        <tr v-for="week in monthlyCalendar" :key="week.id">
          <td
            v-for="date in week.value"
            :key="date.key"
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
  data() {
    return {
      currentYear: this.getCurrentYear(),
      currentMonth: this.getCurrentMonth(),
      calendarYear: this.getCurrentYear(),
      calendarMonth: this.getCurrentMonth(),
      firstWday: this.getFirstWday(),
      lastDate: this.getLastDate(),
      today: this.getCurrentDay(),
      monthlyCalendar: [],
      practices: [],
    }
  },
  mounted() {
    this.getMonthlyCalendar()
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

  methods: {
    token() {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    practiceMarkClass(date) {
      return date.practice ? 'practice-done' : 'practice-none'
    },
    todayClass(date) {
      if (
        this.calendarYear !== this.currentYear ||
        this.calendarMonth !== this.currentMonth
      )
        return
      if (date.date === this.today) return 'is-today'
    },
    getCurrentDay() {
      return new Date().getDate()
    },
    getCurrentYear() {
      return new Date().getFullYear()
    },
    getCurrentMonth() {
      return new Date().getMonth() + 1
    },
    getFirstWday() {
      const firstDay = new Date(this.calendarYear, this.calendarMonth - 1, 1)
      return firstDay.getDay()
    },
    getLastDate() {
      const lastDay = new Date(this.calendarYear, this.calendarMonth, 0)
      return lastDay.getDate()
    },
    getMonthlyCalendar() {
      let value = []
      let key = 0
      let id = 1
      if (this.getFirstWday() >= 1) {
        for (let blank = 0; blank < this.getFirstWday(); blank++) {
          value.push({ key: key })
          key++
        }
      }
      for (let date = 1; date < this.getLastDate() + 1; date++) {
        value.push({ key: key, date: date })
        key++
        if (value.length % 7 === 0 || date === this.getLastDate()) {
          this.monthlyCalendar.push({ id: id, value: value })
          value = []
          id++
          key = 0
        }
      }
    },
    previousMonth() {
      if (this.calendarMonth === 1) {
        this.calendarMonth = 12
        this.calendarYear--
      } else {
        this.calendarMonth--
      }
      this.monthlyCalendar = []
      this.getMonthlyCalendar()
    },
    nextMonth() {
      if (this.calendarMonth === 12) {
        this.calendarMonth = 1
        this.calendarYear++
      } else {
        this.calendarMonth++
      }
      this.monthlyCalendar = []
      this.getMonthlyCalendar()
    },
    newestMonth() {
      return (
        this.currentYear === this.calendarYear &&
        this.currentMonth === this.calendarMonth
      )
    },
  },
}
</script>

<style>
.is-today {
  color: red;
}
</style>
