<script lang="ts">
	import yui_wait from '../files/yui_wait.mp4'
</script>

<div class="indicator">
    <!-- svelte-ignore a11y-media-has-caption -->
    <video autoplay loop width=150>
        <source src={yui_wait} type="video/mp4">
    </video>
</div>

<style>

    .indicator {
        display: flex;
        background: rgba(117, 35, 116, 0.476);
        color: #dc4cdc;
        justify-content: center;
        align-items: center;
		text-align: center;
        position: absolute;
        top: 0;
        bottom: 0;
        right: 0;
        left: 0;
        z-index: 20;
		font-size: 60px;
	}
</style>
