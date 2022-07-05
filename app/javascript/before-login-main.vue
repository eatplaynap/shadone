<template>
  <div id="app">
    <YouTubeLoop />
    <div class="explanations">
      <div class="explanation">
        <h2>What is this?</h2>
        <p>
          ShaDone is a web app for language learners who want to do shadowing
          exercise with YouTube videos. With ShaDone you can
        </p>
        <ul>
          <li>Repeat full or a part of YouTube video</li>
          <li>Set loop how many times you want</li>
        </ul>
      </div>
      <div class="explanation">
        <h2>What can I do if I signed in?</h2>
        <p>You can automatically record your practice duration.</p>
        <p>
          The best way to maintain your learning motivation is by accumulating
          your day-to-day effort!
        </p>
      </div>
    </div>
  </div>
</template>

<script>
import YouTubeLoop from './youtube-loop.vue'

export default {
  components: {
    YouTubeLoop,
  },
}
</script>
