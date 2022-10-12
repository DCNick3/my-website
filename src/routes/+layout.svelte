<script lang="ts">
    import App from '$lib/App.svelte'
    import Head from '$lib/Head.svelte'
</script>

<main>
  <div class="background">
    <!-- repeat them several times to be sure -->
    <img src="/bg.png" alt="" />
    <img src="/bg.png" alt="" />
    <img src="/bg.png" alt="" />
  </div>

  <App>
    <Head />
    <slot />
  </App>
</main>

<style>
.background {
  display: flex;
  flex-direction: row;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  position: fixed;
  z-index: -100;
  user-select: none;
  pointer-events: none;
}

.background > img {
  height: 100%;
  image-rendering: pixelated;
}
</style>
