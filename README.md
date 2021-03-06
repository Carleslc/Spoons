# Spoons

_OSX Automation. Spoons library & Hammerspoon configuration. AutoClick, PasswordGenerator and more._

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/C0C2VFGD)

1. Install **[Hammerspoon](http://www.hammerspoon.org/)**
2. Click on the desired module (spoon) below to see additional documentation and download.

## > [AutoClick](https://github.com/Carleslc/Spoons/blob/master/Spoons/AutoClick.spoon/markdown/AutoClick.md)

*Autoclicker tool, configurable with clicks per seconds.*

## > [PasswordGenerator](https://github.com/Carleslc/Spoons/blob/master/Spoons/PasswordGenerator.spoon/markdown/PasswordGenerator.md)

*Generate simple or strong passwords and copy them to clipboard.*

## > [ReloadConfiguration](https://github.com/Carleslc/Spoons/blob/master/Spoons/ReloadConfiguration.spoon/markdown/ReloadConfiguration.md)

*Adds a hotkey to reload the hammerspoon configuration, and a pathwatcher to automatically reload on changes.*

## > [TextClipboardHistory](https://github.com/Carleslc/Spoons/blob/master/Spoons/TextClipboardHistory.spoon/markdown/TextClipboardHistory.md)

*Keep a history of the clipboard, only for text entries.*

## > [LineageAutoQuest](https://github.com/Carleslc/Spoons/blob/master/Spoons/LineageAutoQuest.spoon/markdown/LineageAutoQuest.md)

*Lineage II Revolution Auto-Quest Bot (Nox App Player)*

## > [MouseCircle](https://github.com/Carleslc/Spoons/blob/master/Spoons/MouseCircle.spoon/markdown/MouseCircle.md)

*Draws a circle around the mouse pointer when a hotkey is pressed.*

## > [Resources](https://github.com/Carleslc/Spoons/blob/master/Spoons/Resources.spoon/markdown/Resources.md)

*Add a resource to https://carleslc.me/resources with the copied URL.*

# Configuration

See [**init.lua**](https://github.com/Carleslc/Spoons/blob/master/init.lua) for examples of Spoons **configuration** and **keybindings**.

### Build documentation for Spoons

_[hammerspoon repository](https://github.com/Hammerspoon/hammerspoon)_

```bash
cd SPOON_FOLDER
python $GITHUB/hammerspoon/scripts/docs/bin/build_docs.py --validate --templates $GITHUB/hammerspoon/scripts/docs/templates/ --output_dir . --json --markdown --debug --standalone .
```
