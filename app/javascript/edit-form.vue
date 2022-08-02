<template>
  <div id="app">
    <label for="memo">Memo</label>
    <p>{{ practiceLogMemo }}</p>

    <div v-if="!editing">
      <button class="btn" @click="editPracticeLog">Edit</button>
    </div>
    <div v-else>
      <textarea
        id="memo"
        v-model="practiceLogMemo"
        class="textarea textarea-bordered"
      />
      <button class="btn" @click="updatePracticeLog(practiceLogMemo)">
        Update
      </button>
      <button class="btn" @click="cancelEdit()">Cancel</button>
    </div>
  </div>
</template>

<script>
import Vue from 'vue'
import VueToast from 'vue-toast-notification'
import 'vue-toast-notification/dist/theme-sugar.css'

Vue.use(VueToast)

export default {
  props: {
    practiceLogId: { type: Number, required: true },
  },
  data() {
    return {
      editing: false,
      practiceLogMemo: null,
    }
  },
  mounted() {
    this.fetchPracticeLogMemo()
  },
  methods: {
    cancelEdit() {
      this.editing = false
    },
    editPracticeLog() {
      this.editing = true
    },
    updatePracticeLog(practiceLogMemo) {
      const params = { memo: practiceLogMemo }
      fetch(`/practice_logs/${this.practiceLogId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.csrfToken(),
        },
        credentials: 'same-origin',
        redirect: 'manual',
        body: JSON.stringify(params),
      }).then(() => {
        this.$toast.success('Successfully updated your practice log!', {
          position: 'top-left',
        })
        this.cancelEdit()
      })
    },
    csrfToken() {
      return document
        .querySelector('meta[name="csrf-token"]')
        ?.getAttribute('content')
    },
    fetchPracticeLogMemo() {
      fetch(`/api/practice_logs/${this.practiceLogId}.json`, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
        },
        credentials: 'same-origin',
      })
        .then((response) => {
          return response.json()
        })
        .then((practiceLog) => {
          this.practiceLogMemo = practiceLog.memo
        })
    },
  },
}
</script>
