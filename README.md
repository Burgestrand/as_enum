# as_enum

Allows you to turn any method that yields into a method that accepts no block and
returns an enumerator instead.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'as_enum'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install as_enum
```

## Usage

```ruby
class Cow
  as_enum def each_thing(x)
    yield x
  end
end

cow = Cow.new
enum = cow.each_thing(5) # => Enumerator
enum.next # => 5
```


## No conflict

as\_enum monkey patches Module by default. If this is unwanted, require `as_enum/source` instead,
and you'll be able to use as\_enum as follows:

```ruby
class Cow
  AsEnum.as_enum self, def each_thing(x)
    yield x
  end
end

cow = Cow.new
enum = cow.each_thing(5) # => Enumerator
enum.next # => 5
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/as_enum/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
