# to_enum

Allows you to turn any method that yields, into a method that accepts no block and
returns an enumerator instead.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_enum'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install to_enum
```

## Usage

```ruby
class Cow
  to_enum def each_thing(x)
    yield x
  end
end

cow = Cow.new
enum = cow.each_thing(5) # => #<Enumerator: #<Cow:0x007fdb74807dc8>:each_thing(5)>
enum.next # => 5
```


## No conflict

to\_enum monkey patches Module by default. If this is unwanted, require `to_enum/source` instead,
and you'll be able to use to\_enum as follows:

```ruby
class Cow
  ToEnum.to_enum self, def each_thing(x)
    yield x
  end
end

cow = Cow.new
enum = cow.each_thing(5) # => #<Enumerator: #<Cow:0x007fdb74807dc8>:each_thing(5)>
enum.next # => 5
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/to_enum/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
