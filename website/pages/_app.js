(typeof global !== "undefined" ? global : window).Prism = Prism;

import Prism from "prism-react-renderer/prism";
import React from "react";
import "../global.css";

require("prismjs/components/prism-dart");

// const addClassToDesignTokens = () => {
//   // Style design token in code snippets
//   const elements = document.getElementsByClassName("token plain");
//   const elementsArray = Array.from(elements);
//   if (elementsArray.length > 0) {
//     elementsArray.forEach((el) => {
//       if (el.textContent && el.textContent.startsWith("$")) {
//         el.classList.add("design-token");
//       }
//     });
//   }
// };

export default function Nextra({ Component, pageProps }) {
  return <Component {...pageProps} />;
}
