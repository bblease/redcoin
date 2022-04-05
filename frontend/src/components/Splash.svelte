<script lang='ts'>
</script>

<div class='splash'>
	<div class='logo-container'>
		<span class='logo'>RedOS</span>
		<span class='tagline'>a communist 💩 coin running on Ethereum</span>
	</div>
</div>

<style lang='scss'>
	@import '../theme';
	@use 'sass:color';

	.logo-container {
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.logo {
		width: 100%;
		text-align: center;
		font-size: 13rem;
		text-shadow: 8px 4px #ff9100, 16px 8px #ff5900;
		z-index: 0;	
	}

	.tagline {
		color: lighten(black, 30%);
		font-size: 2rem;
	}

	.splash {
		display: flex;
		align-items: center;
		position: absolute;
		top: 0px;
		left: 0px;
		background: $windowsGrey;
		height: 100vh;
		width: 100vw;
	}
</style>