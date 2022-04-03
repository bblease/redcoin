<!-- Xi Jinping ad component -->
<script lang='ts'>
	import xi from '../assets/images/daddy_xi.png';
	import CloseButton from './CloseButton.svelte';

	let show: boolean = true;

	const close = () => show = false;
</script>
{#if show}
	<div class='daddy-xi'>
		<div class="close-button-container">
			<CloseButton close={close} />
		</div>
		<div>
			<img class='xi' src={xi} height={250} />
		</div>
		<div class='catch-phrase'>
			<span class='chinese'>哇，多么高的分数!</span>
			<span>😮</span>
		</div>
		<span>daddy Xi says</span>
		<span>"check your social credit score!"</span>
	</div>
{/if}

<style lang='scss'>
	.daddy-xi {
		display: flex;
		flex-direction: column;
		width: fit-content;
		align-items: center;
	}

	.catch-phrase {
		margin-top: -40px;
	}

	span {
		font-weight: bolder;
		font-size: 1.5rem;
	}

	.chinese {
		font-family: 'GNU-Uniform';
		font-size: 2rem;
	}

	.close-button-container {
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		padding: 0px 20px;
	}

</style>