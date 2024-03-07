/**
 * @module Put
 *
 */
export default interface Type {
	/**
	 * The function converts a nested Map object into a nested plain JavaScript object.
	 *
	 * @param Instance - The `Instance` parameter is of type `unknown`, which means it can be any
	 * type. It is used to represent an instance of a class or an object.
	 *
	 */
	(Instance: unknown): Promise<unknown>;
}
