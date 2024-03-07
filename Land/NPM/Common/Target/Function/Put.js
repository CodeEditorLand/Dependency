var Put_default = async (...[Instance]) => {
  if (Instance instanceof Map) {
    const _Value = {};
    for (const [Key, Value] of Instance.entries()) {
      if (Value instanceof Map) {
        _Value[Key] = await (await import("@Function/Put.js")).default(
          Value
        );
      } else {
        _Value[Key] = Value;
      }
    }
    return _Value;
  }
  return Instance;
};
export {
  Put_default as default
};
