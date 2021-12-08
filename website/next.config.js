const withTM = require('next-transpile-modules')(['react-syntax-highlighter'])

const withNextra = require('nextra')({
  theme: 'nextra-theme-docs',
  themeConfig: './theme.config.js',
})

module.exports = withNextra(withTM({}))
