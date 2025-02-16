# to_bf

Ruby gem that converts text strings to valid Brainfuck programs.

## Build Commands

```bash
make test    # or: bundle exec rspec
make lint    # or: bundle exec rubocop
rake build   # Build gem
```

## Critical Rules

- Pin dependencies to exact versions (latest patch unless older version needed)
- Keep docs updated with every code change
- Keep Makefile updated — add new tasks as project evolves
- Only ASCII input supported (Unicode raises error)

## Detailed Guides

| Topic | Guide |
|-------|-------|
| Algorithm | [README.md](README.md#how-it-works) |
| License | [LICENSE.txt](LICENSE.txt) |
