# Witx98 App

## How do I install these formulae?

`brew install witx98/app/<formula>`

Or `brew tap witx98/app` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "witx98/app"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).


curl -sL "https://github.com/witx98/homebrew-test-logchange/releases/download/1.0.14/app-linuxx64.zip" | shasum -a 256 | cut -d " " -f 1

curl -sL "https://github.com/witx98/homebrew-test-logchange/releases/download/1.0.14/app-darwinarm64.zip" | shasum -a 256 | cut -d " " -f 1

curl -sL "https://github.com/witx98/homebrew-test-logchange/releases/download/1.0.14/app-darwinx64.zip" | shasum -a 256 | cut -d " " -f 1
