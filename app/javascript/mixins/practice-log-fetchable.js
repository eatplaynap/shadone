export default {
  data() {
    return {
      practiceLogs: [],
    }
  },
  methods: {
    fetchPracticeLogs() {
      fetch(`/api/practice_logs.json`, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
        },
        credentials: 'same-origin',
      })
        .then((response) => {
          return response.json()
        })
        .then((practiceLogs) => {
          practiceLogs.forEach((practiceLog) => {
            this.practiceLogs.push(practiceLog)
          })
        })
    },
  },
}
