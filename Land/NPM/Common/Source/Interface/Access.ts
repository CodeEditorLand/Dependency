/**
 * @module Access
 *
 */
export default interface Type {
	/**
	 * The function `Access` is a TypeScript function that decrypts and retrieves a specific
	 * view from a stored data object using a provided key and unique identifier.
	 *
	 * @param Key - The `Key` parameter is of type `JsonWebKey["k"]`, which means it expects
	 * a value that is a string representing a JSON Web Key. This key will be used for
	 * decryption.
	 *
	 * @param Identifier - The Identifier parameter is a unique identifier generated using the
	 * `randomUUID` function from the `Crypto` object. It is used to retrieve data from the
	 * KV namespace.
	 *
	 * @param KV - KV is an instance of the KVNamespace class, which is used
	 * to interact with the Workers KV storage. It provides methods for reading, writing,
	 * and deleting data from the KV storage.
	 *
	 * @param View - The `View` parameter is a string that represents the specific
	 * view or property of the decrypted data that you want to access. It is used to
	 * retrieve a specific value from the decrypted data object.
	 *
	 */
	(
		Key: JsonWebKey["k"],
		Identifier: ReturnType<Crypto["randomUUID"]>,
		KV: KVNamespace,
		View: string
	): unknown;
}

import type {
	JsonWebKey,
	KVNamespace,
} from "@cloudflare/workers-types/experimental/index.js";
