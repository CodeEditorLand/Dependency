# Changelog - Dependency

`Land/Dependency/` is our external-dependency umbrella. The two big trees here
are `Microsoft/Dependency/Editor/` (the VS Code source checkout we compile) and
`Tauri/Dependency/<repo>` (our vendored fork of the Tauri ecosystem that the
workspace patches via 51 active `[patch.crates-io]` redirects). Each upstream
tree keeps its own history; this file records what we changed at the umbrella
level - submodule pins, vendoring tooling, and the upstream-PR workflow. Format
adapted from [Keep a Changelog](https://keepachangelog.com/).

## [v2.2] - Bundled-Electron Profile: Correctness Pass (April 2026)

We finalised the Tauri vendoring tooling alongside the bundled-electron
correctness pass. By the end of this cycle the 51 active patches were clean and
`cargo check --workspace` was green.

### Added

- **Tauri full-reset script** (`1bc31a3`, 2026-04-28) - one-shot command that
  re-syncs every Tauri sub-dependency from upstream and re-applies our local
  patch set. Replaces the manual checkout ritual we'd been doing per repo.

### Changed

- **POSIX `sh` shebang** across the maintenance scripts (`c5adb53`, 2026-04-06).
- **Spaces around redirection operators and heredoc delimiters** added for
  readability in the maintenance scripts (`258afee`, 2026-04-06).

## [v2.1] - Full Workbench Lift (Q1-Q2 2026)

We tightened the dependency-management workflow during the workbench-lift cycle.

### Added

- **Upstream PR submission template** (`8724d8f`, 2026-04-11). Gives us a
  consistent shape when sending a fix back to Tauri or one of the vendored
  crates instead of carrying it as a permanent local patch.

### Changed

- **Tauri submodule** updated to latest `main` (`cd4e4b4`, 2026-04-06).
- **Microsoft and Tauri submodules** synced to latest upstream together
  (`a3e6aa3`, 2026-02-27).
- **Continuous submodule pin updates** through Q1 2026 - mostly unlabelled syncs
  as we tracked Microsoft's editor branch and the Tauri ecosystem forward week
  by week.

## [v0.0] - Project Inception

Initial empty umbrella scaffold. The substance lives upstream in the vendored
repositories under `Microsoft/` and `Tauri/`; this file tracks how we manage the
umbrella around them.
