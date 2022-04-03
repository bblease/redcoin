<!-- Desktop container and window container -->
<script lang='ts'>
	import executeIcon from '../assets/images/execute.png';

	import { count } from '../stores/rubles';
	import { WindowStore } from '../stores/WindowStore';
	
	import DaddyXi from './DaddyXi.svelte';
	import Window from './Window.svelte';
	import DesktopIcon from './DesktopIcon.svelte';

	import { Execute } from './apps';

	type IconData = {
		name: string;
		// TODO figure out the img import type
		// assumed to be an img value
		icon: any;
		open: () => void;
	}

	const icons: IconData[] = [
		{
			name: 'execute a comrade',
			icon: executeIcon,
			open: () => { 

			},
		}
	]

	let rubles;

	count.subscribe(n => rubles = n);
</script>
<div class='desktop'>
	<h1 class="ruble-counter">{rubles}₽</h1>
	<div class='icon-container'>
		{#each icons as icon}
			<DesktopIcon name={icon.name} open={icon.open}>
				<img src={icon.icon} height={150} />
			</DesktopIcon>
		{/each}
	</div>
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

	.icon-container {
		position: absolute;
		top: 10%;
		left: 5%; 
		display: flex;
		flex-direction: column;
	}
	
</style>