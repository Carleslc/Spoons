# [docs](index.md) » Resources
---

Add a resource to https://carleslc.me/resources with the copied url

Download: [https://github.com/Carleslc/Spoons/raw/master/Spoons/Resources.spoon.zip](https://github.com/Carleslc/Spoons/raw/master/Spoons/Resources.spoon.zip)

## API Overview
* Variables - Configurable values
 * [path](#path)
 * [python](#python)
* Methods - API calls which can only be made on an object returned by a constructor
 * [add](#add)
 * [addWithCopiedUrl](#addWithCopiedUrl)
 * [bindHotkeys](#bindHotkeys)

## API Documentation

### Variables

| [path](#path)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Resources.path`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | Required. Path to get_info.py script.                                                                     |

| [python](#python)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Resources.python`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | Python command. Defaults to python3                                                                     |

### Methods

| [add](#add)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Resources:add()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Open the add resources form with prefilled information about an URL                                                                     |
| **Parameters**                              | <ul><li>url - URL of the resource to add</li></ul> |

| [addWithCopiedUrl](#addWithCopiedUrl)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Resources:addWithCopiedUrl()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Open the add resources form with prefilled information about the copied URL                                                                     |
| **Parameters**                              | <ul><li>None</li></ul> |

| [bindHotkeys](#bindHotkeys)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Resources:bindHotkeys(mapping)`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Binds hotkeys for Resources                                                                     |
| **Parameters**                              | <ul><li>mapping - A table containing hotkey modifier/key details for the following items:</li><li> add - Open the add resources form with prefilled information about the copied URL</li></ul> |

