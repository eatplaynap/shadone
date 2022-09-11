<template>
  <div id="practiceCalendar">
    <div class="max-w-xl mt-6">
      <div class="bg-base-100 z-0">
        <div class="">
          <div class="navbar bg-base-100 flex justify-center">
            <div class="normal-case text-xl">
              <div
                class="cursor-pointer w-11 h-11 flex items-center justify-center p-2"
                @click="previousMonth"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="sha-icon"
                  viewBox="0 0 24 24"
                  width="100%"
                >
                  <path
                    d="M16.67 0l2.83 2.829-9.339 9.175 9.339 9.167-2.83 2.829-12.17-11.996z"
                  />
                </svg>
              </div>

              <div class="px-8 font-bold text-2xl mb-1 w-64 text-center">
                {{ monthName(calendarMonth) }} {{ calendarYear }}
              </div>

              <div
                v-if="!newestMonth()"
                class="cursor-pointer w-11 h-11 flex items-center justify-center p-2"
                @click="nextMonth"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="sha-icon"
                  viewBox="0 0 24 24"
                  width="100%"
                >
                  <path
                    d="M7.33 24l-2.83-2.829 9.339-9.175-9.339-9.167 2.83-2.829 12.17 11.996z"
                  />
                </svg>
              </div>
              <div
                v-else
                class="blank w-11 h-11 flex items-center justify-center p-2"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="sha-icon is-disabled"
                  viewBox="0 0 24 24"
                >
                  <path
                    d="M7.33 24l-2.83-2.829 9.339-9.175-9.339-9.167 2.83-2.829 12.17 11.996z"
                  />
                </svg>
              </div>
            </div>
          </div>

          <table class="border-collapse border border-neutral w-full">
            <thead class="bg-sub">
              <tr>
                <th class="border border-neutral w-1/7">Su</th>
                <th class="border border-neutral w-1/7">Mo</th>
                <th class="border border-neutral w-1/7">Tu</th>
                <th class="border border-neutral w-1/7">We</th>
                <th class="border border-neutral w-1/7">Th</th>
                <th class="border border-neutral w-1/7">Fr</th>
                <th class="border border-neutral w-1/7">Sa</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="week in calendarWeeks" :key="week.id">
                <td
                  v-for="date in week.value"
                  :key="date.weekDay"
                  :class="[practiceMarkClass(date), todayClass(date)]"
                  class="border border-neutral h-12 align-top"
                >
                  <a
                    v-if="date.id"
                    :href="linkOfPracticeLog(date)"
                    class="sha-date relative block p-1"
                  >
                    <div class="text-left align-top absolute top-0">
                      {{ date.date }}
                    </div>
                    <div class="h-2/3">
                      <img
                        style="transform: rotate(1deg)"
                        src="/images/done.svg"
                        class="h-10/12"
                      />
                    </div>
                  </a>
                  <div v-else class="sha-date block p-1 relative">
                    <div class="text-left align-top absolute top-0">
                      {{ date.date }}
                    </div>
                    <div class="h-2/3">
                      <img src="/images/blank.svg" class="h-10/12" />
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    practiceLogs: { type: Array, required: true },
  },
  data() {
    return {
      currentYear: this.getCurrentYear(),
      currentMonth: this.getCurrentMonth(),
      calendarYear: this.getCurrentYear(),
      calendarMonth: this.getCurrentMonth(),
      humanReadableMonth: this.monthName(),
      today: this.getCurrentDay(),
    }
  },
  computed: {
    calendarPracticeLogs() {
      return this.practiceLogs.filter((practiceLog) =>
        practiceLog.practice_on.includes(
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
        const result = this.calendarPracticeLogs.find(
          (practiceLog) => this.practiceLogDate(practiceLog) === date
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
  methods: {
    linkOfPracticeLog(date) {
      return `/practice_logs/${date.id}`
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
    practiceLogDate(practiceLog) {
      return Number(practiceLog.practice_on.split('-')[2])
    },
    formatMonth(month) {
      return month.toString().padStart(2, '0')
    },
    monthName(month) {
      const months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ]
      return months[month - 1]
    },
  },
}
</script>
