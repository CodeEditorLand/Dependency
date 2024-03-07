/**
 * @module Get
 *
 */
export default interface Type {
	/**
	 * The Get function recursively converts an object into a Map data structure.
	 *
	 * @param Instance - The `Instance` parameter is an object that contains key-value pairs. The keys can
	 * be any string, and the values can be of any type.
	 *
	 */
	(Instance: {
		// biome-ignore lint/suspicious/noExplicitAny:
		[key: string]: any;
		// biome-ignore lint/suspicious/noExplicitAny:
	}): Promise<Map<any, any>>;
}
