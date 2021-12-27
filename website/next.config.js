// eslint-disable-next-line @typescript-eslint/no-var-requires
const withNextra = require("nextra")({
  theme: "nextra-theme-docs",
  themeConfig: "./theme.config.js",
});

module.exports = withNextra({
  reactStrictMode: true,
  experiments: {
    swcLoader: true,
    swcMinify: true,
  },
});
