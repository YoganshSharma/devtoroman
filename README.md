# Devnagri to Roman Script Transliteration

This project is a fork of [ritwikmishra/devanagari-to-roman-script-transliteration](https://github.com/ritwikmishra/devanagari-to-roman-script-transliteration), which provides a Python-based command-line tool to convert text written in the Devanagari script into the Roman (Latin) script.

## Improved Features

- **Enhanced Command-Line Interface (CLI)**

- **Pipe Support**

- **Nix Flakes Integration**

## Installation

### Using Nix

To enter the development environment with all dependencies:


```bash
nix develop
```


This will provide you with a shell where you can run the tool.

## Usage

To transliterate a file:


```bash
devtoroman input.txt -o output.txt
```


To transliterate text from standard input:


```bash
echo "शृण्वन्तु बिश्वे अमृतस्य पुत्राआ ये धामानि दिब्यानि तस्थुः" | devtoroman
```

To see all available options:


```bash
devtoroman --help
```

## License

This project is licensed under the [GPL-3.0 License](https://opensource.org/licenses/GPL-3.0).
