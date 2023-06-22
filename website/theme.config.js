import Image from "next/image";
import CustomSearch from "./components/Search";
const themeConfig = {
  github: "https://github.com/fluttertools/mix",
  projectLink: "https://github.com/fluttertools/mix",
  docsRepositoryBase: "https://github.com/fluttertools/mix/blob/main",
  search: true,
  customSearch: <CustomSearch />,
  titleSuffix: " – Mix",
  logo: (
    <>
      <Image
        className="md:inline object-contain hidden"
        height={16}
        width={16}
        alt="Mix Icon"
        src={"/assets/mix-icon-gradient.svg"}
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
        content="style: An expressive way to effortlessly build design systems in Flutter."
      />
      <meta
        name="og:description"
        content="style: An expressive way to effortlessly build design systems in Flutter."
      />
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:image" content="https://fluttermix.com/og.png" />
      <meta name="twitter:site:domain" content="fluttermix.com" />
      <meta name="twitter:url" content="https://fluttermix.com" />
      <meta
        name="og:title"
        content="style: An expressive way to effortlessly build design systems in Flutter."
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

  prevLinks: true,
  nextLinks: true,
  floatTOC: true,
  footer: true,
  nextThemes: {
    defaultTheme: "dark",
  },
  defaultMenuCollapsed: true,
  footerEditLink: "Edit this page on GitHub",
  darkMode: true,
  footerText: (
    <>
      <a
        href="https://vercel.com/?utm_source=fluttermix&utm_campaign=oss"
        target="_blank"
        rel="noreferrer"
      >
        <Image src="/assets/powered-by-vercel.svg" height={43} width={211} />{" "}
      </a>
    </>
  ),
  unstable_faviconGlyph: "👋",
};

export default themeConfig;
