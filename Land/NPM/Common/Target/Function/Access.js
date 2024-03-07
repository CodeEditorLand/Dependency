var Access_default = async (...[Key, Identifier, { get }, View]) => {
  try {
    const { Vector, Data } = await get(Identifier, {
      type: "json"
    });
    return JSON.parse(
      (await import("buffer")).Buffer.from(
        await (await import("./Decrypt.js")).default(
          await Uint8ArrayFromObject(Data),
          Key ?? "",
          await Uint8ArrayFromObject(Vector)
        )
      ).toString()
    )[View];
  } catch (_Error) {
    console.log(_Error);
  }
};
const { default: Uint8ArrayFromObject } = await import("./Uint8ArrayFromObject.js");
export {
  Uint8ArrayFromObject,
  Access_default as default
};
