# [docs](index.md) » PasswordGenerator
---

Generate simple or strong passwords and copy them to clipboard

Download: [https://github.com/Carleslc/Spoons/](https://github.com/Carleslc/Spoons/)

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
| **Signature**                               | `PasswordGenerator:copyPassword(strong[ , length, chars])`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Generates a random password and copies it to the clipboard                                                                     |
| **Parameters**                              | <ul><li>strong - A boolean, true if password can contain special characters: !\\#$%&()*+-./<=>?@[]^_{|}~</li><li>            or false for only alphanumeric characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789</li><li>            Excludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,</li><li>length - Password length. Defaults to 8.</li><li>chars - Optional charset. If filled then `strong` parameter is ignored and only this charset is used.</li></ul> |
| **Returns**                                 | <ul><li>Generated password</li></ul>          |

| [generatePassword](#generatePassword)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `PasswordGenerator:generatePassword(strong[ , length, chars])`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Generates a random password                                                                     |
| **Parameters**                              | <ul><li>strong - A boolean, true if password can contain special characters: !\\#$%&()*+-./<=>?@[]^_{|}~</li><li>            or false for only alphanumeric characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789</li><li>            Excludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,</li><li>length - Password length. Defaults to 8.</li><li>chars - Optional charset. If filled then `strong` parameter is ignored and only this charset is used.</li></ul> |
| **Returns**                                 | <ul><li>Generated password</li></ul>          |

| [strongPassword](#strongPassword)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `PasswordGenerator:strongPassword([length, chars])`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Generates a random password and copies it to the clipboard                                                                     |
| **Parameters**                              | <ul><li>length - Password length. Defaults to 8.</li><li>chars - Optional charset. If filled then only this charset is used.</li></ul> |
| **Returns**                                 | <ul><li>Generated password</li></ul>          |

| [weakPassword](#weakPassword)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `PasswordGenerator:weakPassword([length, chars])`                                                                    |
| **Type**                                    | Method                                                                     |
| **Description**                             | Generates a random password and copies it to the clipboard                                                                     |
| **Parameters**                              | <ul><li>length - Password length. Defaults to 8.</li><li>chars - Optional charset. If filled then only this charset is used.</li></ul> |
| **Returns**                                 | <ul><li>Generated password</li></ul>          |

