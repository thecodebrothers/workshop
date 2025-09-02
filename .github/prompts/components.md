---
mode: 'agent'
model: Claude Sonnet 3.5
description: 'Generate a new component from Figma and create a Widgetbook use-case'
---
# Step by Step guide to create components
When you're asked to create a component you must
- Call the get_code and get_variable_defs tools from the Figma MCP to obtain general information about the component
- Implement the component for the app
  - Implement `React.ReactNode` instance swap components as a Widget parameter
  - If the `React.ReactNode` property is nullable, the Widget parameter must be nullable as well. 
  - If the component uses a state property e.g. to display hover, do not expose this property externally. Instead use Gesture detectors to implement this stateful behavior. 
- Implement Widgetbook use cases
  - Prefer using knobs over adding additional use-cases 
  - A component property is of nullable type `React.ReactNode`, use a nullable knob as well. 
- Navigate to the Widgetbook use case.
- Obtain the image of the Figma component using the Figma MCP
- Use the get_screenshot Widgetbook tool to compare a Widget state with the Figma component. 
  - Use Addon tools to explore the diffent global state of a component
  - Use theming addons if applicable
  - Use knob tools to explore the different state of a component 
  - Compare the screenshot from Widgetbook with the image from Figma and improve the implementation until both the image show visually the same component. The two images do not need match pixel perfectly. 

## Tests
WARNING: Do not create tests. 

## Using Widgetbook
WARNING: Do not try to run Widgetbook by e.g. exectuing `flutter run` 
WARNING: Do not try to update use-cases by e.g. executing `dart run build_runner` 
- Expect that the build_runner is already running in the background via `dart run build_runner watch -d`
- Use the Widgetbook MCP and its tool to operate Widgetbook
- Use the indexed Widgetbook docs to generate code for Widgetbook
- Expect that the Widgetbook is already running in Debug mode
- If you're unable to detect the use-case prompt the user to manually hot restart the Widgetbook. You must not retry or try to fix the problem. 
