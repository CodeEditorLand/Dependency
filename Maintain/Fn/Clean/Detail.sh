#!/bin/bash

\jq -S --tab "del(\
	.author,\
	.bugs,\
	.categories,\
	.engines,\
	.eslintConfig,\
	.fix,\
	.homepage,\
	.keywords,\
	.license,\
	.peerDependencies,\
	.prettier,\
	.private,\
	.publishConfig,\
	.publisher,\
	.repository,\
	.scripts.[\"check:apply\"],\
	.scripts.[\"fmt:js\"],\
	.scripts.[\"format-check\"],\
	.scripts.[\"format:check\"],\
	.scripts.[\"lint-fix\"],\
	.scripts.[\"lint-format\"],\
	.scripts.[\"lint:client\"],\
	.scripts.[\"lint:eslint\"],\
	.scripts.[\"lint:fix:prettier\"],\
	.scripts.[\"lint:fix\"],\
	.scripts.[\"lint:prettier\"],\
	.scripts.[\"lint:scripts\"],\
	.scripts.[\"lint:server\"],\
	.scripts.[\"prettier-fix\"],\
	.scripts.[\"test:eslint-rules\"],\
	.scripts.[\"test:fmt\"],\
	.scripts.[\"test:lint\"],\
	.scripts.[\"vscode:prepublish\"],\
	.scripts.bump,\
	.scripts.check,\
	.scripts.eslint,\
	.scripts.fmt,\
	.scripts.format,\
	.scripts.lint,\
	.scripts.nodemon,\
	.scripts.package,\
	.scripts.posttest,\
	.scripts.prepublish,\
	.scripts.pretest,\
	.scripts.test,\
	.scripts.tslint,\
	.scripts.typecheck,\
	.scripts.watch,\
	.tags,\
	.test,\
	.tslint\
	.type,\
	.version\
)" package.json >|package.json.tmp

\mv package.json.tmp package.json

Omit=(
	"@babel/eslint-config-internal"
	"@babel/eslint-parser"
	"@babel/eslint-plugin-development"
	"@babel/eslint-plugin-development-internal"
	"@eslint/eslintrc"
	"@eslint/js"
	"@microsoft/eslint-config-azuretools"
	"@microsoft/eslint-config-fast-dna"
	"@mixer/parallel-prettier"
	"@nicolo-ribaudo/eslint-scope-5-internals"
	"@typescript-eslint/eslint-plugin"
	"@typescript-eslint/eslint-plugin-tslint"
	"@typescript-eslint/experimental-utils"
	"@typescript-eslint/parser"
	"@typescript-eslint/utils"
	"eslint"
	"eslint-cli"
	"eslint-config-airbnb"
	"eslint-config-commonality"
	"eslint-config-next"
	"eslint-config-prettier"
	"eslint-config-standard"
	"eslint-formatter-autolinkable-stylish"
	"eslint-formatter-codeframe"
	"eslint-import-resolver-node"
	"eslint-import-resolver-typescript"
	"eslint-plugin-filenames"
	"eslint-plugin-header"
	"eslint-plugin-html"
	"eslint-plugin-import"
	"eslint-plugin-jest"
	"eslint-plugin-jsdoc"
	"eslint-plugin-jsx-a11y"
	"eslint-plugin-license-header"
	"eslint-plugin-local"
	"eslint-plugin-local-rules"
	"eslint-plugin-n"
	"eslint-plugin-no-null"
	"eslint-plugin-no-only-tests"
	"eslint-plugin-node"
	"eslint-plugin-notice"
	"eslint-plugin-prefer-arrow"
	"eslint-plugin-prettier"
	"eslint-plugin-promise"
	"eslint-plugin-react"
	"eslint-plugin-react-hooks"
	"eslint-plugin-require-path-exists"
	"eslint-plugin-security"
	"eslint-plugin-simple-import-sort"
	"eslint-plugin-standard"
	"eslint-plugin-tslint"
	"eslint-plugin-unicorn"
	"eslint-plugin-unused-imports"
	"eslint-plugin-vue"
	"eslint-rule-composer"
	"eslint-scope"
	"eslint-utils"
	"eslint-visitor-keys"
	"gulp-eslint"
	"prettier"
	"prettier-eslint"
	"prettier-eslint-cli"
	"tslint"
	"tslint-eslint-rules"
	"vue-eslint-parser"
)

Key() {
	for Dependency in "${Omit[@]}"; do
		\jq -S --tab "del(\
			.[\"$1\"].[\"${Dependency}\"]\
		)" package.json >|package.json.tmp

		\mv package.json.tmp package.json
	done
}

Key "dependencies"
Key "devDependencies"
