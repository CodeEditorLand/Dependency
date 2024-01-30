/**
 * @module Worker
 *
 */
export default interface Type extends ExportedHandler<Environment> {
	fetch: (
		Request: Request,
		Environment: Environment,
		Context: ExecutionContext,
	) => Promise<Response>;
}

import type {
	ExecutionContext,
	ExportedHandler,
	Request,
	Response,
} from "@cloudflare/workers-types/experimental/index.js";

import type Environment from "../Interface/Environment.js";
