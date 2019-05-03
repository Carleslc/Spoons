# [docs](index.md) » MouseCircle
---

Draws a circle around the mouse pointer when a hotkey is pressed

Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/MouseCircle.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/MouseCircle.spoon.zip)

## API Overview
* Variables - Configurable values
 * [color](#color)
* Methods - API calls which can only be made on an object returned by a constructor
 * [bindHotkeys](#bindHotkeys)
 * [show](#show)

## API Documentation

### Variables

| [color](#color)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `MouseCircle.color`                                                                    |
| **Type**                                    | Variable                                                                     |
| **Description**                             | An `hs.drawing.color` table defining the colour of the circle. Defaults to red.                                                                     |

### Methods

| [bindHotkeys](#bindHotkeys)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `MouseCircle:bindHotkeys(mapping)`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Binds hotkeys for MouseCircle                                                                     |
| **Parameters**                              | <ul><li>mapping - A table containing hotkey modifier/key details for the following items:</li><li> show - This will cause the mouse circle to be drawn</li></ul> |

| [show](#show)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `MouseCircle:show()`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Draws a circle around the mouse                                                                     |
| **Parameters**                              | <ul><li>None</li></ul> |
| **Returns**                                 | <ul><li>None</li></ul>          |

