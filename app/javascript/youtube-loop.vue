<template>
  <div id="app">
    <youtube
      ref="youtube"
      :video-id="videoId"
      :player-vars="playerVars"
      @playing="playingVideo"
    ></youtube>
    <div>
      <label>URL:</label>
      <input v-model="newURL" @keyup.enter="changeVideo" />
    </div>
    <div>
      <label>Start from:</label>
      <input v-model.number="startMinute" type="number" />:<input
        v-model.number="startSecond"
        type="number"
      />
      <br />
      <label>End at:</label>
      <input v-model.number="endMinute" type="number" />:<input
        v-model.number="endSecond"
        type="number"
      />
    </div>
    <div>
      <label>Loop Count:</label>
      <input v-model="loopCount" />
    </div>
    <button v-if="playing" @click="pauseVideo">pause</button>
    <button v-else @click="startLoop">loop start</button>
  </div>
</template>

<script>
import Vue from 'vue'
import VueYoutube from 'vue-youtube'
import getYouTubeID from 'get-youtube-id'

Vue.use(VueYoutube)

export default {
  data() {
    return {
      videoId: 'lG0Ys-2d4MA',
      playerVars: {
        rel: 0,
      },
      newURL: 'https://www.youtube.com/watch?v=lG0Ys-2d4MA',
      playing: false,
      startMinute: 0,
      startSecond: 0,
      startTime: 0,
      endMinute: 0,
      endSecond: 0,
      endTime: 0,
      loopCount: 1,
      loopSeconds: 0,
    }
  },
  computed: {
    player() {
      return this.$refs.youtube.player
    },
  },
  methods: {
    token() {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    playVideo() {
      this.player.playVideo()
      this.playing = true
    },
    pauseVideo() {
      this.player.pauseVideo()
      this.playing = false
    },
    playingVideo() {
      console.log(this.newURL)
    },
    calSeconds() {
      this.startTime = this.startMinute * 60 + this.startSecond
      this.endTime = this.endMinute * 60 + this.endSecond
    },
    async setLoop() {
      for (let n = this.loopCount; n > 0; n--) {
        this.player.seekTo(this.startTime)
        this.playVideo()
        const intervalID = setInterval(() => {
          this.loopSeconds += 1
        }, 1000)
        await this.promiseBasedSetTimeout(() => {
          this.pauseVideo()
        }, (this.endTime - this.startTime + 1) * 1000)
        clearInterval(intervalID)
      }
      this.pauseVideo()
    },
    promiseBasedSetTimeout(_, interval) {
      return new Promise((_) => setTimeout(_, interval))
    },
    changeVideo() {
      this.videoId = getYouTubeID(this.newURL)
      return this.videoId
    },
    async startLoop() {
      this.calSeconds()
      await this.setLoop()
      this.createPracticeLog()
    },
    createPracticeLog() {
      const params = {
        user_id: 1,
        url: this.newURL,
        minutes: this.loopSeconds,
      }
      fetch('/api/practices', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.token(),
        },
        credentials: 'same-origin',
        redirect: 'manual',
        body: JSON.stringify(params),
      })
    },
  },
}
</script>
