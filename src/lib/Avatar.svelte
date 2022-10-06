<script lang="ts">
    import avatar from '../files/avatar.png';
</script>

<div class="avatar">
    <img src={avatar} alt="Avatar" />
    <i class="star" style="
        position: absolute;
        top: 135px;
        left: 150px;
        z-index:1;
        fill: #ffa6c0;
        animation-duration:9s;">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="40px">
            <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/>
        </svg>
    </i>
    <i class="star" style="
        position: absolute;
        top: -10px; 
        left: -10px;
        z-index:1;
        fill: #fff6c0;
        animation-duration:14s;">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="28px">
            <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/>
        </svg>
    </i>
</div>
<style>

.avatar {
  position: relative;
}
.avatar > img {
  height: 165px;
  image-rendering: pixelated;
}

.star {
  font-weight: 900;
  animation-name: spin;
  animation-delay: var(--fa-animation-delay,0s);
  animation-direction: var(--fa-animation-direction,normal);
  animation-duration: var(--fa-animation-duration,2s);
  animation-iteration-count: var(--fa-animation-iteration-count,infinite);
  animation-timing-function: var(--fa-animation-timing,linear);
}

@keyframes spin {
  0% {
      transform:rotate(0)
  }
  100% {
      transform:rotate(360deg)
  }
}
</style>