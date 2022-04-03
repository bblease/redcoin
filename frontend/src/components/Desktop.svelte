<!-- Desktop container and window container -->
<script lang='ts'>
	import { count } from '../stores/rubles';
	import DaddyXi from './DaddyXi.svelte';

	let rubles;

	count.subscribe(n => rubles = n);
</script>
<div class='desktop'>
	<h1 class="ruble-counter">{rubles}₽</h1>
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
		
	}

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