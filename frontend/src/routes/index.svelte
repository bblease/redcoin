<script lang='ts'>
	import Taskbar from '../components/Taskbar.svelte';
	import Desktop from '../components/Desktop.svelte';
</script>
<main>
	<div class='desktop-background desktop'>
		<div class='desktop-container'>
			<Desktop />
		</div>
		<Taskbar />
	</div>
</main>

<style lang='scss'>
	@import '../theme';
	.desktop {
		display: flex;
		flex-direction: column;
		flex-grow: 1;
	}

	.desktop-container {
		height: 100%;
	}

	.desktop-background {
		position: absolute;
		top: 0px;
		left: 0px;
		background: #de3333; 
		height: 100vh;
		width: 100vw;
		overflow: hidden;
	}
</style>


