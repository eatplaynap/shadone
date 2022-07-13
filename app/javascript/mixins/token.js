export default {
  methods: {
    token() {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
  },
}
