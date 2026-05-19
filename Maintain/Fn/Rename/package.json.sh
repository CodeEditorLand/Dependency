#!/usr/bin/env bash

Error() {
	\echo "Error: $1" >&2
	\exit 1
}

Read() {
	if [ -f "package.json" ]; then
		JSON=$(< package.json)
	else
		Error "Cannot package.json"
	fi
}

RenameOrganizational=(
	"@azure"
	"@biomejs"
	"@microsoft"
	"@oxc"
	"@rolldown"
	"@rollup"
	"@swc"
	"@tauri-apps"
	"@tauri"
	"@vite"
	"@vitejs"
	"@vscode"
)

RenamePrefix=(
	"azure-"
	"biomejs-"
	"microsoft-"
	"oxc-"
	"rolldown-"
	"rollup-"
	"swc-"
	"tauri-"
	"tauri-apps-"
	"vite-"
	"vitejs-"
	"vscode-"
)

RenamePrefixOrganizational=(
	"@azure-"
	"@biomejs-"
	"@microsoft-"
	"@oxc-"
	"@rolldown-"
	"@rollup-"
	"@swc-"
	"@tauri-"
	"@tauri-apps-"
	"@vite-"
	"@vitejs-"
	"@vscode-"
)

PatternRenameOrganizational=$(
	IFS="|"
	\echo "(${RenameOrganizational[*]})"
)

PatternRenamePrefix=$(
	IFS="|"
	\echo "(${RenamePrefix[*]})"
)

_PatternRenamePrefix=$(
	IFS="|"
	\echo "(${RenamePrefixOrganizational[*]})"
)

Process() {
	local Temporary="$JSON"
	local Processed

	if ! Processed=$(\echo "$Temporary" | jq -e -S --tab '
        try (
            .name |= if test("^'"$PatternRenameOrganizational"'") then
                sub("^'"$PatternRenameOrganizational"'"; "@codeeditorland")
            elif test("^'"$PatternRenamePrefix"'") then
                sub("^'"$PatternRenamePrefix"'"; "@codeeditorland/")
            elif test("^'"$_PatternRenamePrefix"'") then
                sub("^'"$_PatternRenamePrefix"'"; "@codeeditorland/")
            else .
            end
        ) catch . ' 2> /dev/null); then

		\Error "Cannot name"
	fi

	Temporary="$Processed"

	if ! Processed=$(\echo "$Temporary" | jq -e -S --tab '
        try (
            .dependencies |= if . == null then
                {}
            else
                with_entries(.key |= if test("^'"$PatternRenameOrganizational"'") then
                    sub("^'"$PatternRenameOrganizational"'"; "@codeeditorland")
                elif test("^'"$PatternRenamePrefix"'") then
                    sub("^'"$PatternRenamePrefix"'"; "@codeeditorland/")
                elif test("^'"$_PatternRenamePrefix"'") then
                    sub("^'"$_PatternRenamePrefix"'"; "@codeeditorland/")
                else .
                end)
            end
        ) catch . ' 2> /dev/null); then

		\Error "Cannot dependencies"
	fi

	Temporary="$Processed"

	if ! Processed=$(\echo "$Temporary" | jq -e -S --tab '
        try (
            .devDependencies |= if . == null then
                {}
            else
                with_entries(.key |= if test("^'"$PatternRenameOrganizational"'") then
                    sub("^'"$PatternRenameOrganizational"'"; "@codeeditorland")
                elif test("^'"$PatternRenamePrefix"'") then
                    sub("^'"$PatternRenamePrefix"'"; "@codeeditorland/")
                elif test("^'"$_PatternRenamePrefix"'") then
                    sub("^'"$_PatternRenamePrefix"'"; "@codeeditorland/")
                else .
                end)
            end
        ) catch . ' 2> /dev/null); then

		\Error "Cannot devDependencies"
	fi

	\echo "$Processed" >| package.json || \Error "Cannot package.json"
}

Fn() {
	Read
	Process
	sort-package-json
}

Fn || Error "Cannot Rename/package.json.sh"
