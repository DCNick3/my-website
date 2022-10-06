<script lang="ts">
  import bg from './files/bg.png'
  import Head from './lib/Head.svelte'
  import Profile from './lib/Profile.svelte'
  import CutePic from './lib/CutePic.svelte'
</script>

<main>
  <div class="background">
    <!-- repeat them several times to be sure -->
    <img src={bg} alt="" />
    <img src={bg} alt="" />
    <img src={bg} alt="" />
  </div>

  <Head />
  <Profile />
  <CutePic />
  
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