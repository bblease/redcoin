import { derived, writable, type Writable } from 'svelte/store';

interface Window {
	name: string;
	focus: boolean;
	icon: any;

	// TODO - figure out this type
	component: any;
}

interface WindowPos extends Window {
	left: number;
	top: number;
}

interface WindowInfo {
	name: string;
	focused: boolean;
	icon: any;
}

export class WindowStore {
	public windows: Writable<WindowPos[]>;
	constructor() {
		this.windows = writable([]);
	}

	/**
	 * Get window info without component information
	 */
	get componentList() {
		return derived(this.windows, ($windows) =>
			$windows.map(({ name, focused, icon }) => ({ name, focused, icon }))
		);
	}

	get names(): string[] {
		return derived(this.windows, ($windows) => $windows.map(({ name }) => name));
	}

	public closeWindow = (name: string) => {
		this.windows.update((windows) => {console.log(windows); return windows.filter((w: Window) => w.name !== name)});

	};

	public openWindow = (data: Window) => {
		this.windows.update((windows: WindowPos) => {
			const newWindow: WindowPos = { 
				...data, 
				left: 300 + 20 * windows.length, 
				top: 300 + 20 * windows.length 
			};

			if (!windows.map((window: Window) => window.name).includes(data.name))
				return [...windows, newWindow];
			else
				return windows
		});
	};

	public setFocus = (i: number) => {
		this.windows.update((windows) => {
			return windows.map((window: Window, j: number) =>
				j === i ? { ...window, focus: true } : { ...window, focus: false }
			);
		});
	};

	public moveWindow = (name: string, left: number, top: number) => {
		this.windows.update((windows: Window[]) => 
			windows.map((window: Window) => window.name === name ? { ...window, left, top } : window)
		)
	}
}

export const WindowManager = new WindowStore();
