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
      newURL: undefined,
      playing: false,
      startMinute: 0,
      startSecond: 0,
      startTime: 0,
      endMinute: 0,
      endSecond: 0,
      endTime: 0,
      loopCount: 1,
    }
  },
  computed: {
    player() {
      return this.$refs.youtube.player
    },
  },
  methods: {
    playVideo() {
      this.player.playVideo()
      this.playing = true
    },
    pauseVideo() {
      this.player.pauseVideo()
      this.playing = false
    },
    playingVideo() {
      console.log('we are watching!!!')
    },
    calSeconds() {
      this.startTime = this.startMinute * 60 + this.startSecond
      this.endTime = this.endMinute * 60 + this.endSecond
    },
    async setLoop() {
      for (let n = this.loopCount; n > 0; n--) {
        this.player.seekTo(this.startTime)
        this.playVideo()
        await this.promiseBasedSetTimeout(() => {
          this.pauseVideo()
        }, (this.endTime - this.startTime + 1) * 1000)
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
    startLoop() {
      this.calSeconds()
      this.setLoop()
    },
  },
}
</script>
