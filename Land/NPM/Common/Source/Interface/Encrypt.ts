/**
 * @module Encrypt
 *
 */
export default interface Type {
	/**
	 * The Encrypt function encrypts data using the AES-GCM algorithm with a given key.
	 *
	 * @param Data - The `Data` parameter is the data that you want to encrypt. It
	 * can be of any type, but it will be converted to a JSON string before encryption.
	 *
	 * @param Key - The `Key` parameter is a string that represents the encryption
	 * key used to encrypt the data. It is used to derive a symmetric encryption key that is
	 * compatible with the AES-GCM algorithm.
	 *
	 */
	(Data: unknown, Key: string): Promise<Data>;
}

import type Data from "../Interface/Data.js";
