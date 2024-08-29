export default {
	arrowParens: "always",
	bracketSameLine: true,
	bracketSpacing: true,
	cursorOffset: -1,
	embeddedLanguageFormatting: "auto",
	endOfLine: "lf",
	htmlWhitespaceSensitivity: "css",
	insertPragma: false,
	jsxSingleQuote: false,
	printWidth: 80,
	proseWrap: "always",
	quoteProps: "preserve",
	requirePragma: false,
	semi: true,
	singleQuote: false,
	tabWidth: 4,
	trailingComma: "es5",
	useTabs: true,
	vueIndentScriptAndStyle: true,
	plugins: [
		"@ianvs/prettier-plugin-sort-imports",
		"prettier-plugin-astro",
		"prettier-plugin-organize-attributes",
		"prettier-plugin-packagejson",
		"prettier-plugin-sh",
		"prettier-plugin-tailwindcss",
		"prettier-plugin-toml",
	],
	overrides: [
		{
			files: "*.astro",
			options: {
				parser: "astro",
			},
		},
		{
			files: "*.svelte",
			options: {
				parser: "svelte",
			},
		},
		{
			files: "*.lua",
			options: {
				parser: "lua",
			},
		},
		{
			files: "*.toml",
			options: {
				parser: "toml",
			},
		},
		{
			files: "package.json",
			options: {
				trailingComma: "none",
			},
		},
	],
	attributeGroups: ["$DEFAULT", "^data-"],
	attributeSort: "ASC",
	attributeIgnoreCase: false,
	importOrder: [
		"^@core/(.*)$",
		"",
		"^@server/(.*)$",
		"",
		"^@ui/(.*)$",
		"",
		"^[./]",
	],
	importOrderParserPlugins: ["typescript", "jsx", "decorators-legacy"],
	importOrderTypeScriptVersion: "5.5.4",
};
