import Image from "next/image";
import { useRouter } from "next/router";
import CustomSearch from "./components/Search";

const themeConfig = {
  useNextSeoProps() {
    const { asPath } = useRouter();
    if (asPath !== "/") {
      return {
        titleTemplate: "%s – Mix",
      };
    }
  },
  logo: (
    <>
      <Image
        height={32}
        width={32}
        alt="Mix Icon"
        src={"/assets/mix-icon.svg"}
      />
      <span className="mr-2 font-extrabold mx-2 md:inline">Mix</span>
    </>
  ),
  project: {
    link: "https://github.com/conceptadev/mix",
  },
  docsRepositoryBase: "https://github.com/conceptadev/mix/blob/main",
  search: {
    component: <CustomSearch />,
  },
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
  navigation: {
    prev: true,
    next: true,
  },
  toc: {
    float: true,
    backToTop: true,
  },
  darkMode: true,
  nextThemes: {
    defaultTheme: "dark",
    forcedTheme: "dark",
  },
  sidebar: {
    defaultMenuCollapseLevel: 5,
    autoCollapse: false,
    toggleButton: false,
  },
  primaryHue: {
    light: 200,
    dark: 300,
  },
  primarySaturation: {
    light: 50,
    dark: 40,
  },
  editLink: {
    text: "Edit this page on GitHub",
  },
  footer: {
    text: (
      <>
        <a
          href="https://vercel.com/?utm_source=fluttermix&utm_campaign=oss"
          target="_blank"
          rel="noreferrer"
        >
          <Image
            alt="mix logo"
            src="/assets/powered-by-vercel.svg"
            height={43}
            width={211}
          />{" "}
        </a>
      </>
    ),
  },
};

export default themeConfig;
