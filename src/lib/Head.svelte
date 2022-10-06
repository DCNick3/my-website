<script lang="ts">
    import logo from '../files/logo.png'
    import chel from '../files/chel.gif'
  </script>
  
<div class="head">
    <div class="head-logo">
        <img src={logo} alt="My Website" />
    </div>
    <div>
        <span class="uwu">Uwu!</span>
        <span style="color: #cc55cc;">Welcome to my home page.</span>
        <img src={chel} style="vertical-align: middle;" alt="" />
    </div>
</div>

<style>
.head {
  text-align: center;
  font-size: 1.7em;
}

.head-logo {
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