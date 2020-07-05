import { createApp } from './vue.esm.prod.js'
import App from './App.js'

async function main () {
  createApp(App, { user: {name: 'Mato'} }).mount('#app')
}

main()
