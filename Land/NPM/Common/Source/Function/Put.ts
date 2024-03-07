/**
 * @module Put
 *
 */
export default (async (...[Instance]: Parameters<Type>) => {
	if (Instance instanceof Map) {
		const _Value = {} as {
			// biome-ignore lint/suspicious/noExplicitAny:
			[key: string]: any | ReturnType<Type>;
		};

		for (const [Key, Value] of Instance.entries()) {
			if (Value instanceof Map) {
				_Value[Key] = await (
					await import("@Function/Put.js")
				).default(Value);
			} else {
				_Value[Key] = Value;
			}
		}

		return _Value;
	}

	return Instance;
}) satisfies Type as Type;

import type Type from "../Interface/Put.js";
