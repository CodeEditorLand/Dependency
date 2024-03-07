/**
 * @module Decrypt
 *
 */
export default interface Type {
    /**
     * The function `Decrypt` is a TypeScript function that uses the Web Crypto API to
     * decrypt data using the AES-GCM algorithm.
     *
     * @param Data - Data is the encrypted data that needs to be decrypted. It
     * is of type Uint8Array, which is an array-like object representing an array of 8-bit
     * unsigned integers.
     *
     * @param Key - The `Key` parameter is a string that represents the encryption
     * key used for decrypting the data. It should be a valid key value for the specified
     * encryption algorithm (AES-GCM).
     *
     * @param Vector - The `Vector` (Initialization Vector) is a random value used in the
     * encryption process to ensure that the same plaintext does not produce the same
     * ciphertext. It is a fixed-size random or pseudo-random value that is typically
     * required for symmetric encryption algorithms like AES-GCM (Advanced Encryption
     * Standard - Galois/Counter Mode
     *
     */
    (Data: Uint8Array, Key: JsonWebKey["k"], Vector: Uint8Array): Promise<Uint8Array>;
}
import type { JsonWebKey } from "@cloudflare/workers-types/experimental/index.js";
