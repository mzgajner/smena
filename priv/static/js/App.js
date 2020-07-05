import { defineComponent } from './vue.esm.prod.js'
import PunchInButton from './components/PunchInButton.js'

export default defineComponent({
  components: { PunchInButton },
  template: /*html*/`
    <section class="section">
      <div class="container">
        <h1 class="title">Smena!</h1>
        <punch-in-button />
      </div>
    </section>
  `
})
