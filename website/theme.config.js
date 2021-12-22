export default {
  github: 'https://github.com/leoafarias/mix',
  docsRepositoryBase: 'https://github.com/leoafarias/mix/blob/main',
  titleSuffix: ' – Mix',
  floatTOC: true,
  logo: (
    <>
      <img
        className="md:inline object-contain hidden"
        style={{ height: '1em' }}
        src={
          'https://raw.githubusercontent.com/leoafarias/mix/main/assets/mix-icon.svg'
        }
      />
      <span className="mr-2 font-extrabold mx-2 hidden md:inline">Mix</span>
      <span className="text-gray-600 font-normal text-sm hidden md:inline">
        Effortlessly build Flutter design systems.
      </span>
    </>
  ),
  head: (
    <>
      <meta name="msapplication-TileColor" content="#ffffff" />
      <meta name="theme-color" content="#ffffff" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <meta httpEquiv="Content-Language" content="en" />
      <meta
        name="description"
        content="Mix: An expressive way to effortlessly build design systems in Flutter."
      />
      <meta
        name="og:description"
        content="Mix: An expressive way to effortlessly build design systems in Flutter."
      />
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:image" content="https://fluttermix.com/og.png" />
      <meta name="twitter:site:domain" content="fluttermix.com" />
      <meta name="twitter:url" content="https://fluttermix.com" />
      <meta
        name="og:title"
        content="Mix: An expressive way to effortlessly build design systems in Flutter."
      />
      <meta name="og:image" content="https://fluttermix.com/og.png" />
      <meta name="apple-mobile-web-app-title" content="Mix" />
      <link
        rel="apple-touch-icon"
        sizes="180x180"
        href="/apple-icon-180x180.png"
      />
      <link
        rel="icon"
        type="image/png"
        sizes="192x192"
        href="/android-icon-192x192.png"
      />
      <link
        rel="icon"
        type="image/png"
        sizes="32x32"
        href="/favicon-32x32.png"
      />
      <link
        rel="icon"
        type="image/png"
        sizes="16x16"
        href="/favicon-16x16.png"
      />
      <link rel="manifest" href="/site.webmanifest" />
      <meta name="msapplication-TileImage" content="/ms-icon-150x150.png" />
    </>
  ),
  search: true,
  prevLinks: true,
  nextLinks: true,
  footer: true,
  footerEditLink: 'Edit this page on GitHub',
  footerText: <>MIT {new Date().getFullYear()} © Mix.</>,
  unstable_faviconGlyph: '👋',
}
