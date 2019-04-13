# Rofi Charpicker
A simple, fast, and keyboard-centric way to pick emoji, kaomoji, and special characters
under X and Wayland.

![A sample of Rofi Charpicker displaying a search for cakes](/screenshots/charpicker sample.png)

## Installing Charpicker

You need to have `rofi` and `xdotool`. `rofi` handles selection and `xdotool` actually
enters the characters.

Then simply clone or download the repository and point a keyboard shortcut (I use Super+I)
at the script.

## Using Charpicker

You simply type a search into the Rofi search bar. Some conveniences are provided such
as `gi` for ι and `gI` for Ι (and similar for other Greek letters).

You can add modifiers like gender and skin tone with provided sequences. For instance,
"child" gives 🧒, while "child" "+ female" gives 🧒‍♀️ and "child" "+ medium-light
skin tone" gives 🧒‍🏼.

## Customizing Charpicker

Rofi Charpicker uses a simple flat file to store characters. The format of each line is:

```text
keywords    :character
```

Everything after the `:` is typed, except trailing spaces (allowing kaomoji).
This file is `special_character_list`. It was compiled partially with a machine
and partially by hand (with help from mbfraga) and contributions are much appreciated.

