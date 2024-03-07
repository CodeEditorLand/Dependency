/**
 * @module Redirect
 *
 */
export default interface Type {
    (URL?: string, Status?: number): Promise<Response>;
}
import type { Response } from "@cloudflare/workers-types/experimental/index.js";
