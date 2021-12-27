/* eslint-disable @next/next/google-font-display */

import Document, { Head, Html, Main, NextScript } from "next/document";

class MyDocument extends Document {
  render() {
    return (
      <Html>
        <Head>
          <link rel="preconnect" href="https://fonts.googleapis.com" />
          <link
            rel="preconnect"
            href="https://fonts.gstatic.com"
            crossOrigin="true"
          />
          <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&display=block"
            rel="stylesheet"
          />
          <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/@docsearch/js@alpha/dist/cdn/docsearch.min.css"
          />
        </Head>
        <body>
          <Main />
          <NextScript />
          <script
            src="https://cdn.jsdelivr.net/npm/@docsearch/js@alpha"
            async
            defer
          />
        </body>
      </Html>
    );
  }
}

export default MyDocument;
