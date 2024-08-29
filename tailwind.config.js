import { fontFamily } from "tailwindcss/defaultTheme";

/** @type {import('tailwindcss').Config} */
var config = {
	content: [
		"./Public/**/*.html",
		"./Source/**/*.{astro,css,html,js,json,jsx,md,mdx,scss,svelte,ts,tsx,vue}",
		"./index.html",
		__dirname + "/**/*.vue",
		__dirname + "/frontend/**/*.{css,html,ts,js}",
		__dirname + "/src/main.js",
		__dirname + "/src/{components,views}/**/*.js",
	],

	darkMode: "media",

	theme: {
		container: {
			center: true,
		},

		extend: {
			ringWidth: {
				2: "2.1px",
			},

			transitionTimingFunction: {
				Ease: "cubic-bezier(0.21, 0.1, 0.21, 1)",
			},

			fontFamily: {
				sans: ["Fira Sans", "Albert Sans", ...fontFamily.sans],
			},

			typography: {
				DEFAULT: {
					css: {
						a: {
							"font-weight": "400",
						},
					},
				},
			},

			colors: {
				backgroundDark: "var(--background-dark)",
				backgroundLight: "var(--background-light)",
			},
		},
	},

	plugins: [
		require("@tailwindcss/forms"),
		require("@tailwindcss/typography"),
		require("@tailwindcss/aspect-ratio"),
	],
};
