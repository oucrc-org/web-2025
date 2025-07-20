export default {
  semi: true,
  singleQuote: false,
  tabWidth: 2,
  useTabs: false,
  trailingComma: "es5",
  printWidth: 80,
  jsxSingleQuote: false,
  bracketSameLine: false,
  plugins: ["prettier-plugin-astro"],
  overrides: [
    {
      files: "*.astro",
      options: {
        parser: "astro",
        htmlWhitespaceSensitivity: "ignore",
        bracketSameLine: false,
      },
    },
    {
      files: ["*.tsx", "*.jsx"],
      options: {
        jsxSingleQuote: false,
        bracketSameLine: false,
      },
    },
  ],
};
