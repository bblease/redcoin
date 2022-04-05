<!-- Desktop container and window container -->
<script lang='ts'>
	import executeIcon from '../assets/images/execute.png';
	import toilIcon from '../assets/images/toil.png';
	import settingsIcon from '../assets/images/settings.png';

	import { count } from '../stores/rubles';
	import { WindowManager } from '../stores/WindowStore';
	
	import DaddyXi from './DaddyXi.svelte';
	import Window from './Window.svelte';
	import DesktopIcon from './DesktopIcon.svelte';

	import { Execute } from './apps';

	type IconData = {
		name: string;
		// TODO figure out the img import type
		// assumed to be an img value
		icon: any;
		open: (props: {name: string; icon: string}) => void;
	}

	const icons: IconData[] = [
		{
			name: 'execute a comrade',
			icon: executeIcon,
			open: ({ name, icon }) => { 
				WindowManager.openWindow({
					name,
					icon,
					focus: true,
					component: Execute
				})
			},
		}, {
			name: 'toil ₽+',
			icon: toilIcon,
			open: ({ name, icon }) => { 
				WindowManager.openWindow({
					name,
					icon,
					focus: true,
					component: Execute
				})
			},
		}, {
			name: 'settings',
			icon: settingsIcon,
			open: ({ name, icon }) => { 
				WindowManager.openWindow({
					name,
					icon,
					focus: true,
					component: Execute
				})
			}
		}
	];

	const { windows } = WindowManager;

	const setFocus = (i: number) => WindowManager.setFocus(i);
	const closeWindow = (name: string) => WindowManager.closeWindow(name);

	console.log(windows);
</script>
<div class='desktop'>
	<h1 class="ruble-counter">{$count}₽</h1>
	<div class='icon-container'>
		{#each icons as icon}
			<DesktopIcon {...icon} />
		{/each}
	</div>

	{#each $windows as win, i}
		<Window close={() => closeWindow(win.name)} onDrag={() => setFocus(i)} offset={i * 20} {...win}>
			<svelte:component this={win.component} /> 
		</Window>

	{/each}
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
		z-index: 10000;
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