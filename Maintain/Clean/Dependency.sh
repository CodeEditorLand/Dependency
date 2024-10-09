#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	(
		for SubDependency in "${SubDependency[@]}"; do
			( # shellcheck disable=SC2154
				\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit

				\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o \
					\( \
					-iname .prettierrc \
					-o -iname '.changes' \
					-o -iname '.github' \
					-o -iname .azure-pipelines \
					-o -iname .changeset \
					-o -iname .clang-format \
					-o -iname .eslint-plugin-local \
					-o -iname .configurations \
					-o -iname .csharpierrc \
					-o -iname .devcontainer \
					-o -iname .editorconfig \
					-o -iname eslint.js \
					-o -iname .eslintignore \
					-o -iname .eslintplugin \
					-o -iname eslint.config.js \
					-o -iname .eslintrc.base.json \
					-o -iname .eslintrc.cjs \
					-o -iname .eslintrc.js \
					-o -iname .eslintrc.json \
					-o -iname .eslintrc.yaml \
					-o -iname .eslintrc.yml \
					-o -iname .husky \
					-o -iname .mailmap \
					-o -iname .mention-bot \
					-o -iname .nvmrc \
					-o -iname .pnpm-store \
					-o -iname .prettierignore \
					-o -iname .prettierrc.cjs \
					-o -iname .prettierrc.js \
					-o -iname .prettierrc.json \
					-o -iname .prettierrc.yaml \
					-o -iname .rustfmt.toml \
					-o -iname .stylua.toml \
					-o -iname .vscode \
					-o -iname .vscode-test.js \
					-o -iname .yarnrc \
					-o -iname ARCHITECTURE -type f \
					-o -iname ARCHITECTURE.md \
					-o -iname ARCHITECTURE.txt \
					-o -iname CHANGELOG -type f \
					-o -iname CHANGELOG.md \
					-o -iname CHANGELOG.txt \
					-o -iname CODE_OF_CONDUCT -type f \
					-o -iname CODE_OF_CONDUCT.md \
					-o -iname CODE_OF_CONDUCT.txt \
					-o -iname CONTRIBUTING -type f \
					-o -iname CONTRIBUTING.md \
					-o -iname CONTRIBUTING.txt \
					-o -iname Cargo.lock \
					-o -iname MAINTENANCE -type f \
					-o -iname MAINTENANCE.md \
					-o -iname MAINTENANCE.txt \
					-o -iname README.md \
					-o -iname SECURITY -type f \
					-o -iname SECURITY.md \
					-o -iname SECURITY.txt \
					-o -iname SUPPORT -type f \
					-o -iname SUPPORT.md \
					-o -iname SUPPORT.txt \
					-o -iname biome.json \
					-o -iname jsconfig.json \
					-o -iname package-lock.json \
					-o -iname pnpm-global \
					-o -iname pnpm-lock.yaml \
					-o -iname prettier.config.cjs \
					-o -iname prettier.config.js \
					-o -iname prettier.config.mjs \
					-o -iname renovate.json \
					-o -iname .node-version \
					-o -iname rome.json \
					-o -iname rust-toolchain -type f \
					-o -iname rust-toolchain.toml \
					-o -iname rustfmt.toml \
					-o -iname tsfmt.json \
					-o -iname webpack.config.js \
					-o -iname yarn.lock \
					\) -exec rm -rf {} \;

				\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o \
					\( \
					-name test \
					-o -name '__snapshot__' \
					-o -name '__snapshots__' \
					-o -name '__test__' \
					-o -name '__tests__' \
					-o -name 'fixtures' \
					-o -name 'tests' \
					\) -type d -exec rm -rf {} \;

				\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o \
					\( \
					-iname '*.unit.test.ts' \
					-o -iname '*.js.snap' \
					-o -iname '*.jsx.snap' \
					-o -iname '*.spec.*.map' \
					-o -iname '*.spec.*.snap' \
					-o -iname '*.spec.js' \
					-o -iname '*.spec.ts' \
					-o -iname '*.spec.tsx' \
					-o -iname '*.test.*.map' \
					-o -iname '*.test.data.*' \
					-o -iname '*.test.js' \
					-o -iname '*.test.json' \
					-o -iname '*.test.ts' \
					-o -iname '*.ts.snap' \
					-o -iname '*.tsx.snap' \
					-o -iname '*.unit.test.js' \
					\) -exec rm -rf {} \;

				\cd - || \exit
			) &
		done

		\wait
	) &
done

\wait
