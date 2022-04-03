<script lang='ts'>
	import CloseButton from './CloseButton.svelte';

	export let name: string;

	export let left: number = 300;
	export let top: number = 300;
	
	let moving: boolean = false;
		
	// inner height - taskbar height - window header height
	const desktopHeight = window.innerHeight - 60 - 40;
	const desktopWidth = window.innerWidth - 40;

	function onMouseDown() {
		moving = true;
	}
	
	function onMouseMove(e) {
		if (moving) {
			if (top + e.movementY > desktopHeight) {
				top = desktopHeight;
			} else {
				top += e.movementY;
			}

			if (left + e.movementX > desktopWidth) {
				left = desktopWidth;
			} else {
				left += e.movementX;
			}	
		}
	}
	
	function onMouseUp() {
		moving = false;
	}
	
	const close = () => {};
</script>

<div class='window' style="left: {left}px; top: {top}px;">
	<div on:mousedown={onMouseDown}  class="box-element draggable header">
		<div class='icon'></div>
		{name}
		<CloseButton close={close} />
	</div>
	<div class='content'>
		<slot>
		</slot>
	</div>
</div>

<svelte:window on:mouseup={onMouseUp} on:mousemove={onMouseMove} />

<style lang='scss'>
	@import '../theme';
	@use "sass:color";

	.content {
		background: $windowsGrey;
		border: 2px solid darken($windowsGrey, 50%);
		border-top: none; 
	}

	.window {
		position: absolute;
		width: 600px;
		box-shadow: 2px 2px 6px 0px rgba(0,0,0,0.83);
	}

	.header {
		display: flex;
		justify-content: space-between;
		padding: 0.2rem;
		align-items: center;
	}

	.draggable {
		user-select: none;
	}
</style>