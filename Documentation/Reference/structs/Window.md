**STRUCT**

# `Window`

A structure representing a simple window type.

Note that multiple instances of a window can be opened at the same time.

## Properties
### `id`

The window's identifier.

### `content`

The window's content.

### `open`

Whether an instance of the window type should be opened when the app is starting up.

## Methods
### `init(id:open:content:)`

Create a window type with a certain identifier and user interface.
- Parameters:
  - id: The identifier.
  - open: The number of instances of the window type when the app is starting.
  - content: The window's content.

### `createWindow(app:)`

Get the storage for the window.
- Parameter app: The application.
- Returns: The storage.

### `createGTUIWindow(app:)`

Get the window.
- Parameter app: The application.
- Returns: The window.

### `getViewStorage(window:)`

Get the storage of the content view.
- Parameter window: The window.
- Returns: The storage of the content of the window.

### `update(_:)`

Update a window storage's content.
- Parameter storage: The storage to update.