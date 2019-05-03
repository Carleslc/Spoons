# [docs](index.md) » PasswordGenerator
---

Generate simple or strong passwords and copy them to clipboard

Download: [https://github.com/Carleslc/Spoons/raw/master/Spoons/PasswordGenerator.spoon.zip](https://github.com/Carleslc/Spoons/raw/master/Spoons/PasswordGenerator.spoon.zip)

## API Overview
* Methods - API calls which can only be made on an object returned by a constructor
 * [copyPassword](#copyPassword)
 * [generatePassword](#generatePassword)
 * [strongPassword](#strongPassword)
 * [weakPassword](#weakPassword)

## API Documentation

### Methods

| [copyPassword](#copyPassword)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `PasswordGenerator:copyPassword(strong[, length, chars])`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Generates a random password and copies it to the clipboard                                                                     |
| **Parameters**                              | <ul><li>strong - A boolean, true if password can contain special characters: !\\#$%&()*+-./<=>?@[]^_{}~ or false for only alphanumeric characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789 Excludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,</li><li>length - Password length. Defaults to 8.</li><li>chars - Optional charset. If filled then `strong` parameter is ignored and only this charset is used.</li></ul> |
| **Returns**                                 | <ul><li>Generated password</li></ul>          |

| [generatePassword](#generatePassword)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `PasswordGenerator:generatePassword(strong[, length, chars])`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Generates a random password                                                                     |
| **Parameters**                              | <ul><li>strong - A boolean, true if password can contain special characters: !\\#$%&()*+-./<=>?@[]^_{}~ or false for only alphanumeric characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789 Excludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,</li><li>length - Password length. Defaults to 8.</li><li>chars - Optional charset. If filled then `strong` parameter is ignored and only this charset is used.</li></ul> |
| **Returns**                                 | <ul><li>Generated password</li></ul>          |

| [strongPassword](#strongPassword)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `PasswordGenerator:strongPassword([length, chars])`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Generates a random password and copies it to the clipboard. This method can use special characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789!\\#$%&()*+-./<=>?@[]^_{}~ Excludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,                                                                     |
| **Parameters**                              | <ul><li>length - Password length. Defaults to 8.</li><li>chars - Optional charset. If filled then only this charset is used.</li></ul> |
| **Returns**                                 | <ul><li>Generated password</li></ul>          |

| [weakPassword](#weakPassword)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `PasswordGenerator:weakPassword([length, chars])`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Generates a random password and copies it to the clipboard. This method uses only alphanumeric characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789 Excludes similar characters like O and 0                                                                     |
| **Parameters**                              | <ul><li>length - Password length. Defaults to 8.</li><li>chars - Optional charset. If filled then only this charset is used.</li></ul> |
| **Returns**                                 | <ul><li>Generated password</li></ul>          |

