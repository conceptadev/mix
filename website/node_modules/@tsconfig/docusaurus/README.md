### A base TSConfig for working with Docusaurus v2.

Add the package to your `"devDependencies"`:

```sh
npm install --save-dev @tsconfig/docusaurus
yarn add --dev @tsconfig/docusaurus
```

Add to your `tsconfig.json`:

```json
"extends": "@tsconfig/docusaurus/tsconfig.json"
```

---

The `tsconfig.json`: 

```jsonc
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "display": "Docusaurus v2",
  "docs": "https://v2.docusaurus.io/docs/typescript-support",
  
  "compilerOptions": {
    "allowJs": true,
    "esModuleInterop": true,
    "jsx": "react",
    "lib": ["DOM"],
    "noEmit": true,
    "noImplicitAny": false,
    "types": ["node", "@docusaurus/module-type-aliases", "@docusaurus/theme-classic"],
    "baseUrl": ".",
    "paths": {
      "@site/*": ["./*"]
    }
  }
}

```

You can find the [code here](https://github.com/tsconfig/bases/blob/master/bases/docusaurus.json).