# Groceries App x Widgetbook

This repository hosts a groceries demo application creatively called _Groceries App_.

## Getting Started

1. In the root folder, bootstrap the app

   ```bash
   flutter pub get    # Install deps
   flutter gen-l10n   # Generate localization files
   ```

1. In the `widgetbook` folder, run Widgetbook

   ```bash
   flutter pub get                 # Install deps
   dart run build_runner build -d  # Generate files
   flutter run                     # Run
   ```

# Setup

Make sure to have completed the following setup before the workshop starts. 

## Flutter

Make sure you have Flutter 3.35 / Dart 3.9 installed.

## Setup IDE

Setup Cursor, if you've already used the free trial, try another email. 

Note: If you don't have access or don't want to use Cursor, you can use VS Code + Copilot + Claude Sonnet instead. 

## Setup Doc Indexes

1. In Cursor go to Settings > Cursor Settings > Indexing & Docs
1. In the bottom add the following docs to index
   - `https://docs.widgetbook.io` 
   - `https://pub.dev/documentation/widgetbook/latest/widgetbook/`

Note: This might take some time. 

## Setup MCP servers

1. In Cursor go to Settings > Cursor Settings > MCP & Integrations
1. Click the "New MCP Server" button at the bottom of the page to open Cursor's mcp.json file
1. Insert the following code

```json
{
  "mcpServers": {
    "Widgetbook MCP": {
      "type": "http",
      "url": "http://127.0.0.1:3013/mcp"
    },
    "Figma MCP": {
      "type": "http",
      "url": "http://127.0.0.1:3845/mcp"
    },
    "dart": {
      "command": "dart",
      "args": [
        "mcp-server"
      ]
    }
  }
}
```

Note: MCP servers for VS Code are pre-defined in `.vscode/mcp.json`. 

## Rules

We created pre-defined cursor rules (`.cursor/rules`) for the workshop. 
These rules are not automatically applied. 
You can check them out in advance. 

Note: If you're using VS Code you can find the rules in `.github/prompts`. 

## Setup Figma Deskop

1. Make sure you have the lastest version of the Figma Desktop App installed. 
1. If you don't have a Figma account with an Professional, Organization, or Enterprise plan, log into the following Figma account:
   - Email: `engineering@widgetbook.io`
   - Password: `WidgetbookWorkshop`
   - Notes: Account will be deactivated after the workshop 
1. If you have one of the mentioned paid plans, open the Figma file

## Resources

- [🔗 Figma File](https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7225-2991&t=4oLAnrUYEax8YzGo-1)
- [🔗 Widgetbook Docs](https://docs.widgetbook.io/)
- [🔗 Widgetbook Cloud](https://app.widgetbook.io/)
