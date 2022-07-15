export default {
  data() {
    return {
      practices: [],
    }
  },
  methods: {
    fetchPractices() {
      fetch(`/api/practices.json`, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
        },
        credentials: 'same-origin',
      })
        .then((response) => {
          return response.json()
        })
        .then((practices) => {
          practices.forEach((practice) => {
            this.practices.push(practice)
          })
        })
    },
  },
}
