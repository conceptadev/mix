import SyntaxHighlighter from 'react-syntax-highlighter'
import dart from 'react-syntax-highlighter/dist/esm/languages/hljs/dart'
import { nightOwl } from 'react-syntax-highlighter/dist/esm/styles/hljs'
// far, nightOwl
const Code = ({ children, isCalloutChild = false }) => {
  const code = children.trim()
  const calloutChildClass = isCalloutChild ? 'code-snippet--callout-child' : ''

  return (
    <SyntaxHighlighter
      language={dart}
      style={nightOwl}
      showLineNumbers={false}
      className={`code-snippet ${calloutChildClass}`}
    >
      {code}
    </SyntaxHighlighter>
  )
}

export default Code
