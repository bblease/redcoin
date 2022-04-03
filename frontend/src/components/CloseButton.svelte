<script lang='ts'>
	import closeIcon from '../assets/icons/close.png';
	const HEIGHT = 15;

	export let close: () => void;

</script>

<div class='button close-button' on:click={close}>
	<img src={closeIcon} height={HEIGHT} width={HEIGHT}/>
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
