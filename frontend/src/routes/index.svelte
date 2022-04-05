<script lang='ts'>
	import Taskbar from '../components/Taskbar.svelte';
	import Desktop from '../components/Desktop.svelte';
	import Splash from '../components/Splash.svelte';

	// disable splash during development
	let disableSplash: boolean = false;
	let showSplash: boolean = true;

	if (!disableSplash)
		setTimeout(() => showSplash = false, 2500);
</script>
<main>
	{#if showSplash}
	<Splash />
	{:else}
	<div class='desktop-background desktop'>
		<div class='desktop-container'>
			<Desktop />
		</div>
		<Taskbar />
	</div>
	{/if}
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


