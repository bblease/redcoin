import { derived, writable, type Writable } from 'svelte/store';

interface Window {
	name: string;
	focused: false;
	icon: any;

	// TODO - figure out this type
	component: any;
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

	public closeWindow(name: string) {
		this.windows.update(windows => windows.filter((w: Window) => w.name !== name));
	}

	public openWindow(data: Window) {
		this.windows.update(windows => [...windows, data]);
	}
}