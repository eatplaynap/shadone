<template>
  <div id="youtubeloop">
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
    <div>
      <label>Playback Speed:</label>
      <select v-model="playbackSpeed">
        <option v-for="item in selectItems" :key="item.id" :value="item.speed">
          {{ item.speed }}
        </option>
      </select>
    </div>
    <button v-if="playing" @click="pauseVideo">pause</button>
    <button v-else @click="startLoop">loop start</button>
    <p>{{ remainingLoopCount }}</p>
  </div>
</template>

<script>
import Vue from 'vue'
import VueYoutube from 'vue-youtube'
import getYouTubeID from 'get-youtube-id'
import dayjs from 'dayjs'

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
      remainingLoopCount: null,
      playbackSpeed: 1,
      selectItems: [
        { id: 1, speed: 0.25 },
        { id: 2, speed: 0.5 },
        { id: 3, speed: 0.75 },
        { id: 4, speed: 1 },
        { id: 5, speed: 1.25 },
        { id: 6, speed: 1.5 },
        { id: 7, speed: 1.75 },
        { id: 8, speed: 2 },
      ],
      today: this.getCurrentDay(),
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
    setPlaybackRate() {
      this.player.setPlaybackRate(this.playbackSpeed)
    },
    getLoopDataFromForm() {
      this.startTime = this.startMinute * 60 + this.startSecond
      this.endTime = this.endMinute * 60 + this.endSecond
    },
    async setLoop() {
      for (
        this.remainingLoopCount = this.loopCount;
        this.remainingLoopCount > 0;
        this.remainingLoopCount--
      ) {
        this.player.seekTo(this.startTime)
        this.playVideo()
        await this.promiseBasedSetTimeout(() => {
          this.pauseVideo()
        }, ((this.endTime - this.startTime + 1) / this.playbackSpeed) * 1000)
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
      this.setPlaybackRate()
      this.getLoopDataFromForm()
      await this.setLoop()
      this.createPracticeLog()
    },
    calPracticeDuration() {
      this.loopSeconds =
        ((this.endTime - this.startTime) * this.loopCount) / this.playbackSpeed
    },
    getCurrentDay() {
      return dayjs().format('YYYY-MM-DD')
    },
    createPracticeLog() {
      this.calPracticeDuration()
      const params = {
        user_id: 1,
        url: this.newURL,
        duration: this.loopSeconds,
        practice_on: this.today,
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
      }).catch((error) => {
        console.error(error)
      })
      this.$emit('custom-event')
      // todo: change event name and pass current user id
    },
  },
}
</script>
