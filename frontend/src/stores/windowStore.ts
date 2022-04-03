import { derived, writable, type Writable } from 'svelte/store';

interface Window {
	name: string;
	focused: boolean;
	icon: any;

	// TODO - figure out this type
	component: any;
}

interface WindowInfo {
	name: string;
	focused: boolean;
	icon: any;
}

export class WindowStore {
	public windows: Writable<Window[]>;
	constructor() {
		this.windows = writable([]);
	}

	/**
	 * Get window info without component information
	 */
	get componentList() {
		return derived(
			this.windows, 
			$windows => $windows.map(
				({name, focused, icon}) => ({ name, focused, icon})
		));
	}

	get names(): string[] {
		return derived(
			this.windows,
			$windows => $windows.map(({ name }) => name)
		);
	}

	public closeWindow = (name: string) => {
		this.windows.update(windows => windows.filter((w: Window) => w.name !== name));
	}

	public openWindow = (data: Window) => {
		this.windows.update(windows => {
			console.log(windows);

			if (!windows.map((window: Window) => window.name).includes(data.name))
				return [...windows, data];

			else 
				return windows.map((window: Window) => 
					window.name === data.name ? { ...window, focus: true } : window );
		});
	}

	public setFocus = (i: number) => {
		this.windows.update(windows => {
			return windows.map((window: Window, j: number) => 
				j === i ? 
				{...window, focus: true} : 
				{...window, focus: false});
		})
	}
}

export const WindowManager = new WindowStore();