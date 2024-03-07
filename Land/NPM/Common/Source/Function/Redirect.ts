/**
 * @module Redirect
 *
 */
export default (async (...Option: Parameters<Type>) =>
	Response.redirect(
		Option[0] ?? "",
		Option[1] ?? 302
	)) satisfies Type as Type;

import type Type from "../Interface/Redirect.js";

export const { Response } = await import(
	"@cloudflare/workers-types/experimental/index.js"
);
