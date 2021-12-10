import 'nextra-theme-docs/style.css'
import Prism from 'prism-react-renderer/prism'
import React from 'react'
import '../styles.css'
;(typeof global !== 'undefined' ? global : window).Prism = Prism
require('prismjs/components/prism-dart')

const addClassToDesignTokens = () => {
  // Style design token in code snippets
  const elements = document.getElementsByClassName('token plain')
  const elementsArray = Array.from(elements)
  if (elementsArray.length > 0) {
    elementsArray.forEach((el) => {
      if (el.textContent && el.textContent.startsWith('$')) {
        el.classList.add('design-token')
      }
    })
  }
}

const addStyleToHighlightLines = () => {
  // Style design token in code snippets
  const elements = document.getElementsByClassName('token-line')
  const elementsArray = Array.from(elements)

  const highlightLines = []
  if (elementsArray.length > 0) {
    elementsArray.forEach((el) => {
      if (
        el.getAttribute('style') !== null &&
        el.getAttribute('style') !== ''
      ) {
        el.classList.add('highlight')
        el.parentElement.classList.add('has-highlight')
        highlightLines.push(el)
      }
    })
    // Add first class for each element that previous simbling does not have class 'highlight'
    // and last class for each element that next simbling does not have class 'highlight'
    highlightLines.forEach((el) => {
      console.log(el)
      if (
        el.previousSibling &&
        !el.previousSibling.classList.contains('highlight')
      ) {
        console.log(el.previousSibling)
        el.classList.add('first')
      }
      if (el.nextSibling && !el.nextSibling.classList.contains('highlight')) {
        console.log(el.nextSibling)
        el.classList.add('last')
      }
    })
  }
}

export default function Nextra({ Component, pageProps }) {
  React.useEffect(() => {
    addClassToDesignTokens()
    addStyleToHighlightLines()
  }, [])

  return <Component {...pageProps} />
}
