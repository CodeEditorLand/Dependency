/**
 * @module Worker
 *
 */
export default interface Type {
    Token: string;
    Repository: KVNamespace;
}
import type { KVNamespace } from "@cloudflare/workers-types/experimental/index.js";
