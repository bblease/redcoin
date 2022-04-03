<!-- Desktop container and window container -->
<script lang='ts'>
	import DaddyXi from './DaddyXi.svelte';
</script>
<div class='desktop'>
	<div id='popup'>
		<DaddyXi />
	</div>
</div>
<style lang='scss'>
	.desktop {
		height: 100%;
		width: 100vw;
	}

	#popup {
		position: absolute;
		bottom: 100px;
		right: 5%;
	}
	
</style>