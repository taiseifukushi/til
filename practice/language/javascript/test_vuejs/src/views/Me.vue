<template>
  <div class="Index">
    <h1>This is an "Index" page</h1>
    <div><MyComponent msg="Myページへようこそ!!!"/></div>
  </div>
</template>

<script>
// @ is an alias to /src
import MyComponent from '@/components/MyComponent.vue'

export default {
  name: 'Me',
  components: {
    MyComponent
  }
}
</script>
