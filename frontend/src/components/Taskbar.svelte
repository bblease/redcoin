<script lang='ts'>
	import star from '../assets/icons/soviet_star.png';

	let showStart: boolean;
</script>

<div class='taskbar'>
	<button 
		title='start' 
		class='start-button button russian' 
		on:click={() => showStart = true}>
		Начало
		<img alt='soviet star' src={star} height={30} />
	</button>
</div>

<style lang='scss'>
	@import '../theme';
	.taskbar {
		display: flex;
		align-items: center;
		background: $windowsGrey;
		height: 50px;
		width: 100vw;
		position: absolute;
		bottom: 0px;
		border-top: 5px solid $windowsBorderLight;
		border-bottom: 5px solid $windowsBorderDark;
		z-index: 9999;

		.start-button {
			height: 40px;
			margin-left: 0.5rem;
			margin-right: 0.5rem;
		}
	}

	
</style>