import { defineComponent, reactive } from '../vue.esm.prod.js'
import { punch, fetchPunches } from '../api.js'

async function getCurrentStatus(state) {
  const response = await fetchPunches();
  const punches = response.data;
  state.punchedIn = punches[punches.length - 1].in;
}

export default defineComponent({
  setup() {
    const state = reactive({ punchedIn: false });
    getCurrentStatus(state);

    const clickHandler = async () => {
      await punch();
      await getCurrentStatus(state);
    }

    return {
      state,
      clickHandler,
    }
  },
  template: /*html*/`
    <button
      class="button is-large"
      :class="state.punchedIn ? 'is-danger' : 'is-success'"
      @click="clickHandler"
    >
      {{ state.punchedIn ? 'Punch Out' : 'Punch In' }}
    </button>
  `
})
