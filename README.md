## Problem

There is a content view that may show an alert to user. If there is `@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>` defined in the content view, then the alert shown may have three OK buttons.

## How to reproduce

### Environment

- macOS 10.15.4
- Xcode 11.4

### Steps

1. Create a new iOS Master-Detail app
2. Enable Mac Catalyst
3. Define `presentationMode` in the ContentView
4. Define a button that may trigger an alert
5. Run the code
6. Click that button

## Expected behavior

An alert with one OK button shown

## Observed behavior

An alert with three OK button shown
![A dialog with three OK button](./Screenshot%202020-03-29%20at%2011.07.03%20PM.png)

## Discussion

I've prepared [an app](https://github.com/tsekityam/Master-Detail/tree/mac-catalyst-alert-with-persentation-mode) that will trigger the issue.

Once you run the app, you should see a exclamation mark button in the master view. Click that button will trigger an alert. The alert will have three OK buttons.

Once the line of presentationMode removed, then the alert will become normal.
