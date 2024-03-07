var Response_default = async (...Option) => new Response(JSON.stringify(Option[0]), {
  status: Option[1] ?? 200,
  headers: {
    "Content-Type": "application/json;charset=utf-8"
  }
});
const { Response } = await import("@cloudflare/workers-types/experimental/index.js");
export {
  Response,
  Response_default as default
};
