<template>
  <div id="app">
    <div class="flex items-center">
      <div class="w-24">
        <label for="memo" class="font-bold">Memo</label>
      </div>

      <div class="sha-pre-wrap flex-1" v-text="practiceLogMemo" />
    </div>

    <div class="pt-4">
      <div v-if="!editing" class="flex justify-center">
        <button
          class="py-3 px-4 w-40 bg-success font-semibold rounded-lg sha-icon focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
          @click="editPracticeLog"
        >
          Add Memo
        </button>
      </div>

      <div v-else>
        <textarea
          id="memo"
          v-model="practiceLogMemo"
          class="textarea textarea-bordered textarea-secondary w-full"
        />

        <div class="flex justify-end mt-4 gap-3">
          <div class="flex items-center">
            <button
              class="py-3 px-4 w-28 bg-success font-semibold rounded-lg sha-icon focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
              @click="updatePracticeLog(practiceLogMemo)"
            >
              Update
            </button>
          </div>

          <div class="flex items-center">
            <button
              class="py-3 px-4 w-28 bg-secondary font-semibold rounded-lg sha-icon focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
              @click="cancelEdit()"
            >
              Cancel
            </button>
          </div>
        </div>
      </div>
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
