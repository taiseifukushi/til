<template>
  <div class="MyComponent">
    <h1>{{ msg }}</h1>
    <a class="points">a</a>
  </div>
</template>

<script>
export default {
  name: 'MyComponent',
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
</style>
