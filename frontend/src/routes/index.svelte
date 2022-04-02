<script lang='ts'>
	import Taskbar from '../components/Taskbar.svelte';
</script>
<main>
	<div class='desktop-background'>
		<Taskbar />
	</div>
</main>

<style lang='scss'>
	@import '../theme';
	.desktop-background {
		position: absolute;
		top: 0px;
		left: 0px;
		background: #e02d2d; 
		height: 100vh;
		width: 100vw;
	}
</style>


