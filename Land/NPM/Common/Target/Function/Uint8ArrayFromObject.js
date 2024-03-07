var Uint8ArrayFromObject_default = async (...[_Object]) => {
  const Keys = Object.keys(_Object).map(Number).sort((a, b) => a - b);
  const _Array = new Uint8Array(Keys.length);
  Keys.forEach((Key, Index) => {
    _Array[Index] = _Object[Key] ?? 0;
  });
  return _Array;
};
export {
  Uint8ArrayFromObject_default as default
};
