# [docs](index.md) » TextClipboardHistory
---

Keep a history of the clipboard, only for text entries

Originally based on [code by VFS](https://github.com/VFS/.hammerspoon/blob/master/tools/clipboard.lua), but with many changes and some contributions and inspiration from [asmagill](https://github.com/asmagill/hammerspoon-config/blob/master/utils/_menus/newClipper.lua).

Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/TextClipboardHistory.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/TextClipboardHistory.spoon.zip)

## API Overview
* Variables - Configurable values
 * [deduplicate](#deduplicate)
 * [frequency](#frequency)
 * [hist_size](#hist_size)
 * [honor_ignoredidentifiers](#honor_ignoredidentifiers)
 * [ignoredIdentifiers](#ignoredIdentifiers)
 * [logger](#logger)
 * [menubar_title](#menubar_title)
 * [paste_on_select](#paste_on_select)
 * [show_in_menubar](#show_in_menubar)
* Methods - API calls which can only be made on an object returned by a constructor
 * [bindHotkeys](#bindHotkeys)
 * [checkAndStorePasteboard](#checkAndStorePasteboard)
 * [clearAll](#clearAll)
 * [clearLastItem](#clearLastItem)
 * [pasteboardToClipboard](#pasteboardToClipboard)
 * [shouldBeStored](#shouldBeStored)
 * [showClipboard](#showClipboard)
 * [start](#start)
 * [toggleClipboard](#toggleClipboard)
 * [togglePasteOnSelect](#togglePasteOnSelect)

## API Documentation

### Variables

| [deduplicate](#deduplicate)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.deduplicate`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | Whether to remove duplicates from the list, keeping only the latest one. Defaults to `true`.                                                                     |

| [frequency](#frequency)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.frequency`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | Speed in seconds to check for clipboard changes. If you check too frequently, you will degrade performance, if you check sparsely you will loose copies. Defaults to 0.8.                                                                     |

| [hist_size](#hist_size)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.hist_size`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | How many items to keep on history. Defaults to 100                                                                     |

| [honor_ignoredidentifiers](#honor_ignoredidentifiers)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.honor_ignoredidentifiers`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | If `true`, check the data identifiers set in the pasteboard and ignore entries which match those listed in `TextClipboardHistory.ignoredIdentifiers`. The list of identifiers comes from http://nspasteboard.org. Defaults to `true`                                                                     |

| [ignoredIdentifiers](#ignoredIdentifiers)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.ignoredIdentifiers`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | Types of clipboard entries to ignore, see http://nspasteboard.org. Code from https://github.com/asmagill/hammerspoon-config/blob/master/utils/_menus/newClipper.lua. Default value (don't modify unless you know what you are doing):                                                                     |

| [logger](#logger)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.logger`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | Logger object used within the Spoon. Can be accessed to set the default log level for the messages coming from the Spoon.                                                                     |

| [menubar_title](#menubar_title)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.menubar_title`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | String to show in the menubar if `TextClipboardHistory.show_in_menubar` is `true`. Defaults to `"\u{1f4ce}"`, which is the [Unicode paperclip character](https://codepoints.net/U+1F4CE)                                                                     |

| [paste_on_select](#paste_on_select)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.paste_on_select`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | Whether to auto-type the item when selecting it from the menu. Can be toggled on the fly from the chooser. Defaults to `false`.                                                                     |

| [show_in_menubar](#show_in_menubar)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory.show_in_menubar`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | Whether to show a menubar item to open the clipboard history. Defaults to `true`                                                                     |

### Methods

| [bindHotkeys](#bindHotkeys)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:bindHotkeys(mapping)`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Binds hotkeys for TextClipboardHistory                                                                     |
| **Parameters**                              | <ul><li>mapping - A table containing hotkey objifier/key details for the following items:</li><li> show_clipboard - Display the clipboard history chooser</li><li> toggle_clipboard - Show/hide the clipboard history chooser</li></ul> |

| [checkAndStorePasteboard](#checkAndStorePasteboard)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:checkAndStorePasteboard()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | If the pasteboard has changed, we add the current item to our history and update the counter                                                                     |

| [clearAll](#clearAll)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:clearAll()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Clears the clipboard and history                                                                     |

| [clearLastItem](#clearLastItem)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:clearLastItem()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Clears the last added to the history                                                                     |

| [pasteboardToClipboard](#pasteboardToClipboard)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:pasteboardToClipboard(item)`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Add the given string to the history                                                                     |
| **Parameters**                              | <ul><li>item - string to add to the clipboard history</li></ul> |
| **Returns**                                 | <ul><li>None</li></ul>          |

| [shouldBeStored](#shouldBeStored)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:shouldBeStored()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Verify whether the pasteboard contents matches one of the values in `TextClipboardHistory.ignoredIdentifiers`                                                                     |

| [showClipboard](#showClipboard)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:showClipboard()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Display the current clipboard list in a chooser                                                                     |

| [start](#start)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:start()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Start the clipboard history collector                                                                     |

| [toggleClipboard](#toggleClipboard)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:toggleClipboard()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Show/hide the clipboard list, depending on its current state                                                                     |

| [togglePasteOnSelect](#togglePasteOnSelect)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `TextClipboardHistory:togglePasteOnSelect()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Toggle the value of `TextClipboardHistory.paste_on_select`                                                                     |

