/**
 * @module Uint8ArrayFromObject
 *
 */
export default (async (...[_Object]: Parameters<Type>) => {
	const Keys = Object.keys(_Object)
		.map(Number)
		.sort((a, b) => a - b);

	const _Array = new Uint8Array(Keys.length);

	Keys.forEach((Key, Index) => {
		_Array[Index] = _Object[Key] ?? 0;
	});

	return _Array;
}) satisfies Type as Type;

import type Type from "../Interface/Uint8ArrayFromObject.js";
