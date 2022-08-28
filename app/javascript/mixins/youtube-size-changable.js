export default {
  mounted() {
    window.addEventListener('scroll', this.handleScroll)
  },
  destroyed() {
    window.removeEventListener('scroll', this.handleScroll)
  },
  methods: {
    handleScroll() {
      const youtube = document.querySelector('.sha-youtube__container')
      const urlHeight = document.getElementById('url').getBoundingClientRect().top
      if ( scrollY > urlHeight + scrollY - 30 ) {
        youtube.classList.add('is_scroll')
      } else {
        youtube.classList.remove('is_scroll')
      }
    },
  },
}
