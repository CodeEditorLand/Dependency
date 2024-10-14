#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

File=(
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_core_wasm/example/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_core_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_minifier_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_typescript_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/crates/swc_ecma_minifier/package.json"
	"$Current/../../../SWC/Dependency/SWC/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/core/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/helpers/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/html/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/minifier/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/types/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_core_wasm/example/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_core_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_minifier_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_typescript_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/crates/swc_ecma_minifier/package.json"
	"$Current/../../../SWC/Dependency/SWC/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/core/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/helpers/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/html/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/minifier/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/types/package.json"
)

for File in "${File[@]}"; do
	(
		\cd "$(\dirname "$File")" || \exit

		# shellcheck disable=SC1091
		\source "$Current"/../../Fn/Cache.sh

		Fn

		\pwd

		\git fetch Parent --no-tags

		# shellcheck disable=SC2046
		# shellcheck disable=SC2154
		\git restore --source Parent/"$BranchParent" $(\basename "$File")

		\cd - || \exit
	) &
done

\wait
