/**
 * @module Worker
 *
 */
export default {
	fetch: async (...[Request, Environment]: Parameters<Type["fetch"]>) =>
		await (await import("itty-router/Router"))
			.Router()
			.get(
				"*",
				async () =>
					await Response(
						{
							Error: "Not Found.",
						},
						404,
					),
			)
			.handle(Request, Environment),
} satisfies Type as Type;

// import type Token from "../Interface/Token.js";
import type Type from "../Interface/Worker.js";

// import type { JsonWebKey } from "@cloudflare/workers-types/experimental/index.js";

export const { default: Redirect } = await import(
	"@codeeditorland/common/Target/Function/Redirect.js"
);

export const { default: Response } = await import(
	"@codeeditorland/common/Target/Function/Response.js"
);
