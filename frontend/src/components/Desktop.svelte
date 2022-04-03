<!-- Desktop container and window container -->
<script lang='ts'>
	import { count } from '../stores/rubles';
	import { WindowStore } from '../stores/WindowStore';
	
	import DaddyXi from './DaddyXi.svelte';
	import Window from './Window.svelte';

	let rubles;

	count.subscribe(n => rubles = n);
</script>
<div class='desktop'>
	<h1 class="ruble-counter">{rubles}₽</h1>
	<Window name='window'>
		<span>hello</span>
	</Window>
	<div id='popup'>
		<DaddyXi />
	</div>
</div>
<style lang='scss'>
	.ruble-counter {
		position: absolute;
		width: 100%;
		text-align: center;
		font-size: 7rem;
		text-shadow: 8px 4px #ff9100, 16px 8px #ff5900;
		z-index: 0;	
	}

	.draggable {
		z-index: 1;
	}

	.desktop {
		height: 100%;
		width: 100vw;
	}

	#popup {
		z-index: 2;
		position: absolute;
		bottom: 100px;
		right: 5%;
	}
	
</style>