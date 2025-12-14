# cclock
A KDE clock. It uses the font used in Crystal Castles logo.

# Installation
```
$ git clone https://github.com/a5-truongdz/cclock.git
$ cd cclock
$ cp -r com.tr43212.cclock ~/.local/share/plasma/plasmoids/
$ echo 'export CCLOCK="$HOME/.local/share/plasma/plasmoids/com.tr43212.cclock"' >> ~/.zshrc
$ source ~/.zshrc
```
(Change `.zshrc` to your shell's config file.)

After that it should appears in Edit Mode.

# Configuration
1. Edit `$CCLOCK/contents/config/config.qml`:
```
$ vi $CCLOCK/contents/config/config.qml
```
2. Change the properties:
- `quoteSource`: Any .txt files in `$CCLOCK/assets/quotes/` without the extension.
- `quoteInterval`: Duration between quote refreshes.
- `timeFormat`: Self-explainatory.
- `dateFormat`: Self-explainatory.

# Add your own quotes
1. Put your quotes inside a .txt file, seperated with newlines.
2. You can add comments ("#"), it will be ignored
3. Copy that .txt file to `$CCLOCK/assets/quotes/`:
```
$ cp quotes.txt $CCLOCK/assets/quotes/
```
4. Change the property to use your quotes instead: [Configuration](#-configuration)