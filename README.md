# to_bf

A Ruby gem that converts text strings into valid [Brainfuck](https://en.wikipedia.org/wiki/Brainfuck) programs. The generated programs, when executed by any Brainfuck interpreter, will output the original text.

## Installation

Add it to your Gemfile:

```ruby
gem "to_bf"
```

Or install it directly:

```bash
gem install to_bf
```

## Usage

The gem monkey-patches `String` with a `to_bf` method:

```ruby
require "to_bf"

puts "Hi".to_bf
# => ++++++++++[>+++++++>++++++++<<-]>++.>-.

puts "".to_bf
# => (empty string)

"hello world".to_bf
# => a valid Brainfuck program that prints "hello world"
```

Only ASCII strings are supported. Unicode input raises an error:

```ruby
"emoji 🎉".to_bf
# => RuntimeError: Unicode string are not supported
```

## How It Works

The converter uses an accumulator-based algorithm:

1. **Setup loop** — generates a Brainfuck loop that runs 10 times (`++++++++++[....-]`), initialising each memory cell to `floor(byte_value / 10)` via repeated increments inside the loop.
2. **Remainder pass** — after the loop, each cell is adjusted by `byte_value % 10` additional increments, then printed with `.`.

This keeps the output compact compared to naive unary encoding (e.g. 72 `+` signs for the letter `H`).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then:

```bash
bundle exec rspec      # run tests
bundle exec rubocop    # run linter
bin/console            # interactive prompt with the gem loaded
```

To install the gem locally:

```bash
rake build
gem install pkg/to_bf-0.0.1.gem
```

## License

Released under the [MIT License](LICENSE.txt).
