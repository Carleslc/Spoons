# [docs](index.md) » ReloadConfiguration
---

Adds a hotkey to reload the hammerspoon configuration, and a pathwatcher to automatically reload on changes.

Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ReloadConfiguration.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ReloadConfiguration.spoon.zip)

## API Overview
* Variables - Configurable values
 * [watch_paths](#watch_paths)
* Methods - API calls which can only be made on an object returned by a constructor
 * [bindHotkeys](#bindHotkeys)
 * [start](#start)

## API Documentation

### Variables

| [watch_paths](#watch_paths)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `ReloadConfiguration.watch_paths`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | List of directories to watch for changes, defaults to hs.configdir                                                                     |

### Methods

| [bindHotkeys](#bindHotkeys)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `ReloadConfiguration:bindHotkeys(mapping)`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Binds hotkeys for ReloadConfiguration                                                                     |
| **Parameters**                              | <ul><li>mapping - A table containing hotkey modifier/key details for the following items:</li><li> reloadConfiguration - This will cause the configuration to be reloaded</li></ul> |

| [start](#start)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `ReloadConfiguration:start()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Start ReloadConfiguration                                                                     |
| **Parameters**                              | <ul><li>None</li></ul> |

