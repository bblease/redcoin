<script lang='ts'>
	import closeIcon from '../assets/icons/close.png';
	const HEIGHT = 10;

	export let close: () => void;

</script>

<div class='button close-button' on:click={close}>
	<img alt='close icon' src={closeIcon} height={HEIGHT} width={HEIGHT}/>
</div>

<style lang='scss'>
	@import '../theme';

	.close-button {
		width: fit-content !important;
		height: fit-content;

		img {
			margin: 2px;
		}
	}
</style>
