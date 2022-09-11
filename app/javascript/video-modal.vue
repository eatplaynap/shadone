<template>
  <div id="app">
    <button @click="show" class="py-2 px-4 text-sm bg-accent text-base font-semibold rounded-lg sha-icon">How To Use</button>
      <modal name="instruction-video"
             width="80%"
             :maxWidth="560"
             :adaptive="true">
          <iframe width="100%" height="100%" src="https://www.youtube.com/embed/a-kWmI-RBUQ" frameborder="0" allowfullscreen>></iframe>
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
    show () {
      this.$modal.show('instruction-video');
    },
    hide () {
      this.$modal.hide('instruction-video');
    }
  },
  mount () {
    this.show()
  }
}
</script>
