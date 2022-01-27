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
  async redirects() {
    return [
      {
        source: "/docs/variant",
        destination: "/docs/getting-started/variant",
        permanent: true,
      },
      {
        source: "/docs/getting-started",
        destination: "/docs/getting-started/basic-usage",
        permanent: true,
      },
      {
        source: "/docs/changelog",
        destination: "https://github.com/leoafarias/mix/releases",
        permanent: true,
      },
    ];
  },
});
