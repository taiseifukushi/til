<template>
  <div class="Index">
    <h1>This is an "Index" page</h1>
    <div><HelloWorld msg="Welcome to Your Vue.js App"/></div>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'Home',
  components: {
    HelloWorld
  }
}
</script>
