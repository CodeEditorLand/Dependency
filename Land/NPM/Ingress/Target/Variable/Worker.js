var Worker_default = {
  fetch: async (...[Request, Environment]) => await (await import("itty-router/Router")).Router().get(
    "*",
    async () => await Response(
      {
        Error: "Not Found."
      },
      404
    )
  ).handle(Request, Environment)
};
const { default: Redirect } = await import("@codeeditorland/common/Target/Function/Redirect.js");
const { default: Response } = await import("@codeeditorland/common/Target/Function/Response.js");
export {
  Redirect,
  Response,
  Worker_default as default
};
