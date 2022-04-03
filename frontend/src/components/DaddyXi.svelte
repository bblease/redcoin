<!-- Xi Jinping ad component -->
<script lang='ts'>
	import xi from '../assets/images/daddy_xi.png';
	import CloseButton from './CloseButton.svelte';

	let show: boolean;
</script>
<div>
	<img src={xi} height={60} />
	<span class='chinese'>哇，多么高的分数！😮</span>
	<span>daddy Xi says check your credit score!</span>
</div>