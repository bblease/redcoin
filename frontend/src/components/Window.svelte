<script lang='ts'>
	import CloseButton from './CloseButton.svelte';

	import { WindowManager } from '../stores/WindowStore';

	// props
	export let name: string;
	export let icon: string;
	export let focus: boolean;
	export let component: any;

	export let onDrag: () => void;
	export let close: () => void;

	export let left: number;
	export let top: number;

	let moving: boolean = false;
		

	$: innerHeight = 0;
	$: innerWidth = 0;

	// inner height - taskbar height - window header height
	$: desktopHeight = innerHeight - 60 - 40;
	$: desktopWidth = innerWidth - 40;

	function onMouseDown() {
		onDrag();

		moving = true;
	}

	let leftPos: number;
	let topPos: number;

	$: leftPos = left;
	$: topPos = top;
	
	function onMouseMove(e) {
		if (moving) {
			if (top + e.movementY > desktopHeight) {
				topPos = desktopHeight;
			} else {
				topPos += e.movementY;
			}

			if (left + e.movementX > desktopWidth) {
				leftPos = desktopWidth;
			} else {
				leftPos += e.movementX;
			}	
			WindowManager.moveWindow(name, leftPos, topPos);	
		}
	}
	
	function onMouseUp() {
		moving = false;
	}

	$: zIndex = focus ? 9999 : 'unset';
</script>

<div class='window' style="left: {left}px; top: {top}px; z-index: {zIndex};">
	<div on:mousedown={onMouseDown}  class="box-element draggable header">
		<div class='icon'><img src={icon} height={20}></div>
		{name}
		<CloseButton close={close} />
	</div>
	<div class='content'>
		<slot>
		</slot>
	</div>
</div>

<svelte:window bind:innerWidth bind:innerHeight on:mouseup={onMouseUp} on:mousemove={onMouseMove} />

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