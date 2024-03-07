var Decrypt_default = async (...[Data, Key, Vector]) => new Uint8Array(
  await (await import("@cloudflare/workers-types/experimental")).crypto.subtle.decrypt(
    {
      name: "AES-GCM",
      iv: Vector,
      tagLength: 128
    },
    await (await import("@cloudflare/workers-types/experimental")).crypto.subtle.importKey(
      "jwk",
      {
        kty: "oct",
        k: Key ?? "",
        alg: "A256GCM",
        ext: true
      },
      {
        name: "AES-GCM"
      },
      false,
      ["encrypt", "decrypt"]
    ),
    Data
  )
);
export {
  Decrypt_default as default
};
