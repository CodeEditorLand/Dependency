var Redirect_default = async (...Option) => Response.redirect(
  Option[0] ?? "",
  Option[1] ?? 302
);
const { Response } = await import("@cloudflare/workers-types/experimental/index.js");
export {
  Response,
  Redirect_default as default
};
