export default {
  data() {
    return {
      processing: false
    }
  },
  methods: {
    startProcessing() {
      this.processing = true
    },
    endProcessing() {
      this.processing = false
    },
    isProcessing() {
      return this.processing
    }
  }
}
