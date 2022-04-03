<script lang='ts'>
	export let name: string;
	// on click open action to be called
	export let open: () => void;
</script>

<div class='icon-body' on:click={open}>
	<slot></slot>
	<span>{name}</span>
</div>

<style lang='scss'>
	.icon-body { 
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 150px;
		cursor: pointer;

		span {
			word-wrap: break-word;
			text-align: center;
			text-decoration: underline;
			font-weight: bolder;
		}
	}
</style>