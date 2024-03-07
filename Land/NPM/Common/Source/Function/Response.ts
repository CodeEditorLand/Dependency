/**
 * @module Response
 *
 */
export default (async (...Option: Parameters<Type>) =>
	new Response(JSON.stringify(Option[0]), {
		status: Option[1] ?? 200,
		headers: {
			"Content-Type": "application/json;charset=utf-8",
		},
	})) satisfies Type as Type;

import type Type from "../Interface/Response.js";

export const { Response } = await import(
	"@cloudflare/workers-types/experimental/index.js"
);
