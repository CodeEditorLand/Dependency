# Upstream PR Template

Use this template when submitting PRs to upstream dependencies we patch locally.
Keep changes minimal, backward-compatible, and generic — no Land-specific code.

---

## PR Title Format

```
feat(request): expose request body and method in on_request callback
```

## PR Body

```markdown
## Summary

[One sentence: what capability this adds]

## Motivation

The `on_request` callback currently receives a read-only `Request` with only
the URL. This makes it impossible to implement proxy routes, webhooks, or
request-body-dependent middleware without forking the plugin.

## Changes

- [ ] Extended `Request` with `body()` and `method()` accessors
- [ ] Extended `Response` with `set_status()`, `set_body()`, `set_handled()`
- [ ] `on_request` fires BEFORE asset lookup (was: after)
- [ ] When `response.handled == true`, skip asset resolution and return custom response
- [ ] All existing behavior preserved when `handled == false` (default)

## Breaking Changes

None. The `on_request` callback signature is unchanged:
`Fn(&Request, &mut Response)`. New methods are additive. Default `handled = false`
preserves existing asset-serving behavior.

## Use Cases

1. **OTLP/telemetry proxy** — forward `/v1/traces` to a local collector
2. **Health check endpoint** — respond to `/healthz` without a static asset
3. **API proxy** — forward `/api/*` to a backend during development
4. **CORS preflight** — handle OPTIONS requests with custom headers

## Test Plan

- [ ] Existing asset serving works unchanged (no `set_handled` call)
- [ ] `set_handled(true)` returns custom response, skips asset lookup
- [ ] Request body is correctly read for POST requests
- [ ] Empty body for GET requests (zero allocation)
- [ ] `set_status()` maps to correct HTTP status code
```

---

## Checklist Before Submitting

1. **Diff is minimal** — only the generic capability, no project-specific code
2. **No new dependencies** — raw std or existing crate APIs only
3. **Backward compatible** — all new fields have defaults, no signature changes
4. **Tests pass** — `cargo test -p <crate>` with no regressions
5. **Formatting** — `cargo fmt` with upstream's rustfmt config
6. **Documentation** — doc comments on all new public API surface

---

## Local Patches vs Upstream

| Crate | Local Path | Upstream Repo | Patch Status |
|-------|-----------|---------------|-------------|
| tauri-plugin-localhost | `Dependency/Tauri/Dependency/TauriPluginLocalhost` | tauri-apps/plugins-workspace | `on_request` body/handled |

### Adding a New Patch

1. Fork/clone upstream into `Dependency/<Ecosystem>/Dependency/<CrateName>/`
2. Add to workspace `members` in root `Cargo.toml`
3. Set `path = "Dependency/..."` in `[workspace.dependencies]`
4. Fix any `*.workspace = true` fields not defined in our workspace
5. Make the minimal change
6. Add row to the table above
7. Open upstream PR using template above
8. Once merged + released, revert to version dependency

### Future Upstream Candidates

| Crate | Enhancement | Priority |
|-------|------------|----------|
| tauri-plugin-localhost | Streaming response body (SSE, WebSocket upgrade) | Medium |
| tauri-plugin-localhost | Memory-mapped asset serving (zero-copy) | Low |
| tauri | Deno sidecar runtime (replace Node.js Cocoon) | High |
| tauri | Custom protocol handler with request body access | Medium |
| tiny_http | Connection keep-alive pool for proxy routes | Low |
