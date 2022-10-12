<script lang="ts">
  import Nav from '$lib/Nav.svelte'
</script>
<div class="head">
  <div class="head-logo">
    <img src="/logo.png" alt="My Website" />
  </div>

  <Nav />

  <div class="welcome">
    <span class="uwu">Uwu!</span>
    <span style="color: #cc55cc;">Welcome to my home page.</span>
    <img src="/chel.gif" style="vertical-align: middle;" alt="" />
  </div>
</div>

<style>
.welcome {
  font-size: 1.7em;
}

.head {
  text-align: center;
  margin-bottom: 30px;
}

.head-logo {
  font-size: 1.7em;
  display: flex;
  flex-direction: row;
  justify-content: center;
  height: 10em;
  max-width: 100%;
}

.head-logo > img {
  image-rendering: pixelated;
  height: 100%;
}

.uwu {
  animation: uwu 3.6s infinite;
}
@keyframes uwu{
  0%  { color: #e200c8; }
  33%  { color: #ff5ace; }
  66%  { color: #ba07f0; }
  100%  { color: #e200c8; }
}
</style>