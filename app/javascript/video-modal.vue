<template>
  <div id="app" data-testid="video-modal-container">
    <button
      class="py-2 px-4 text-sm bg-accent text-base font-semibold rounded-lg sha-icon"
      data-testid="how-to-use-button"
      @click="show"
    >
      How To Use
    </button>
    <modal
      name="instruction-video"
      width="80%"
      :max-width="560"
      :adaptive="true"
      data-testid="instruction-video-modal"
    >
      <iframe
        width="100%"
        height="100%"
        src="https://www.youtube.com/embed/a-kWmI-RBUQ"
        frameborder="0"
        allowfullscreen
        >></iframe
      >
    </modal>
  </div>
</template>

<script>
import Vue from 'vue'
import VModal from 'vue-js-modal/dist/index.nocss.js'
import 'vue-js-modal/dist/styles.css'

Vue.use(VModal)

export default {
  name: 'VideoModal',
  methods: {
    show() {
      this.$modal.show('instruction-video')
    },
  },
  mount() {
    this.show()
  },
}
</script>
