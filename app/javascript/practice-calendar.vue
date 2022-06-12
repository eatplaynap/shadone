<template>
  <div id="practiceCalendar">
    <p>{{ currentYear }}年{{ currentMonth }}月</p>
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
        <td v-for="date in week.value" :key="date.key">{{ date.date }}</td>
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
      firstWday: this.getFirstWday(),
      lastDate: this.getLastDate(),
      monthlyCalendar: [],
    }
  },
  mounted() {
    this.getMonthlyCalendar()
  },

  methods: {
    getCurrentYear() {
      return new Date().getFullYear()
    },
    getCurrentMonth() {
      return new Date().getMonth() + 1
    },
    getFirstWday() {
      const firstDay = new Date(this.getCurrentYear(), this.getCurrentMonth() - 1,1)
      return firstDay.getDay()
    },
    getLastDate() {
      const lastDay = new Date(this.getCurrentYear(), this.getCurrentMonth(),0)
      return lastDay.getDate()
    },
    getMonthlyCalendar() {
      let value = []
      let key = 0
      let id = 1
      if (this.getFirstWday() >= 1) {
        for(let blank = 0; blank < this.getFirstWday(); blank++) {
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
    }
  }
}
</script>
