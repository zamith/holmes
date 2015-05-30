# Holmes

Holmes adds a searching layer on top of [Gumbocr](https://github.com/zamith/gumbocr).

## Installation

Add it to `Projectfile`

```crystal
deps do
  github "zamith/holmes"
end
```

## Usage

```crystal
require "holmes"
```

### `all_with_tag`

Get all the elements with a certain tag:

```crystal
Holmes.parse("<p>Paragraph</p>").all_with_tag("p")
```

### `text`

Gets the text for a certain node:

```crystal
Holmes.parse("<p>Paragraph</p>").all_with_tag("p").first.text
# Paragraph
```

### `open`

Downloads and parses an HTML document from an URL:

```crystal
Holmes.open("http://rubyconf.pt").all_with_tag("p").first.text
# 14-15 September
```
## Development

Clone and install dependencies with:

```bash
$ git clone git@github.com:zamith/gumbocr.git
$ cd gumbocr
$ crystal deps
```

## Contributing

1. Fork it ( https://github.com/zamith/holmes/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Zamith](https://github.com/zamith) Zamith - creator, maintainer
