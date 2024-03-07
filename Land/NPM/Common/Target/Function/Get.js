var Get_default = async (...[Instance]) => {
  if (typeof Instance === "string") {
    return Instance;
  }
  const _Map = /* @__PURE__ */ new Map();
  if (typeof Instance === "object") {
    for (const Key in Instance) {
      if (Object.prototype.hasOwnProperty.call(Instance, Key)) {
        if (typeof Instance[Key] === "object" && !Array.isArray(Instance[Key])) {
          _Map.set(
            Key,
            await (await import("@Function/Get.js")).default(
              Instance[Key]
            )
          );
        } else {
          _Map.set(Key, Instance[Key]);
        }
      }
    }
  }
  return _Map;
};
export {
  Get_default as default
};
