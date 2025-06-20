# Lossless Compression

## Variable Length Code (VLC)

The languages we speak have certain traits such as words and letters
that occur more often than other. The following compression algorithms
are designed to shorten the amount of space needed to represent
letters that occur very often in a text.

### Morse Code

The morse code has a fixed set of codes that resemble the probability
of how often the letters appear in words of the language it has been
designed for. The letters that occur more often need less symbols
(`.`/`-`) to be written out.

| Code    | Symbol | Code    | Symbol | Code    | Symbol |
|---------|--------|---------|--------|---------|--------|
| `.-`    | `A`    | `-.`    | `N`    | `.----` | `1`    |
| `-...`  | `B`    | `---`   | `O`    | `..---` | `2`    |
| `-.-.`  | `C`    | `.--.`  | `P`    | `...--` | `3`    |
| `-..`   | `D`    | `--.-`  | `Q`    | `....-` | `4`    |
| `.`     | `E`    | `.-.`   | `R`    | `.....` | `5`    |
| `..-.`  | `F`    | `...`   | `S`    | `-....` | `6`    |
| `--.`   | `G`    | `-`     | `T`    | `--...` | `7`    |
| `....`  | `H`    | `..-`   | `U`    | `---..` | `8`    |
| `..`    | `I`    | `...-`  | `V`    | `----.` | `9`    |
| `.---`  | `J`    | `.--`   | `W`    | `-----` | `0`    |
| `-.-`   | `K`    | `-..-`  | `X`    |
| `.-..`  | `L`    | `-.--`  | `Y`    |
| `--`    | `M`    | `--..`  | `Z`    |

> The international morse code table

### Huffman Code

## Run Length Coding (RLC)

## Lempel-Ziv-Welch (LZW)

## Burrows-Wheeler-Transformation

``` mermaid
graph LR
  A[Start] --> B{Error?};
  B -->|Yes| C[Hmm...];
  C --> D[Debug];
  D --> B;
  B ---->|No| E[Yay!];
```
