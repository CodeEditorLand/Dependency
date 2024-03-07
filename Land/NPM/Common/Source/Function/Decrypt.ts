/**
 * @module Decrypt
 *
 */

export default (async (...[Data, Key, Vector]: Parameters<Type>) =>
	new Uint8Array(
		await (
			await import("@cloudflare/workers-types/experimental")
		).crypto.subtle.decrypt(
			{
				name: "AES-GCM",
				iv: Vector,
				tagLength: 128,
			},
			await (
				await import("@cloudflare/workers-types/experimental")
			).crypto.subtle.importKey(
				"jwk",
				{
					kty: "oct",
					k: Key ?? "",
					alg: "A256GCM",
					ext: true,
				},
				{
					name: "AES-GCM",
				},
				false,
				["encrypt", "decrypt"]
			),
			Data
		)
	)) satisfies Type as Type;

import type Type from "../Interface/Decrypt.js";
