/**
 * @module Uint8ArrayFromObject
 *
 */
export default interface Type {
	/**
	 * The function `Uint8ArrayFromObject` converts an object with keys as numbers and
	 * values as Uint8Array elements into a sorted Uint8Array.
	 *
	 * @param _Object The `Obj` parameter is an object that contains
	 * key-value pairs, where the keys are numbers and the values are Uint8Array values.
	 *
	 */
	(_Object: _Object): Promise<Uint8Array>;
}

import type _Object from "../Interface/Object.ts";
