# simple_ext
This gem provides useful Ruby object extensions, which are very helpful in day to day coding.
This contains combination of some new added extensions + extracted from rails activesupport core extensions

Some basic and common ruby extentions which are used most commonly on objects like array, hash, string etc.

# Install

    gem install simple_ext

or

in Gemfile:

    gem 'simple_ext'

# Usage

To require all the extentions

```ruby
require 'simple_ext'
```  

to require specific module

```ruby
require 'simple_ext/array'
require 'simple_ext/string'
require 'simple_ext/object'
...
```

You can use below extensions:

### Extensions:
We have added some cool extension to use, they are as below:

#### Array:

```ruby
arr.any_nil?  # Check if any element is nil in array
[1, 2, ' ', 4].any_nil? => false
[1, nil, 2, 4].any_nil? => true

arr.any_empty?  # Check if any element is empty in array
[1, 2, ' ', 4].any_empty? => false
[1, nil, 2, 4].any_empty? => false
[1, '', 3, 4].any_empty? => true

arr.any_blank?  # Check if any element is blank in array
[1, 2, ' ', 4].any_blank? => true
[1, nil, 2, 4].any_blank? => true
[1, '', 3, 4].any_blank? => true
[1, 2, 3, 4].any_blank? => false


arr.include_hash_with?(arg)  # Check if an array contains a hash with given key/value pairs
arr = [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]
arr.include_hash_with?({a: 4}) => true
arr.include_hash_with?({"a" => 4, "b" => 5}) => true
arr.include_hash_with?({a: 4, b: 6}) => false

arr.include_string_with?(arg)   # Check if array contains a string with given substring
arr = ['abc', 'def', 'pqr', 'xyz']
arr.include_string_with?('pq')  => true
arr.include_string_with?('df')  => false

arr.find_hash_with  # Find a hash from array which matches given key/value pairs
arr = [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]
arr.find_hash_with({a: 4})  => {a: 4, b: 5, c: 6}
arr.find_hash_with({"b" => 2, "c" => 3}) => {a: 1, b: 2, c: 3}
arr.find_hash_with({ a: 4, c: 8 }) => nil

arr.select_hash_with   # Select all hash elements from an array, which matches given key/value pairs
arr = [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}, {a: 1, b: 8, c: 9}]
arr.select_hash_with({ a: 1 }) => [{a: 1, b: 2, c: 3}, {a: 1, b: 8, c: 9}]
```

#### Hash:

```ruby
hash.sub_hash_of?  # Check if current hash is sub hash of given hash
{a: 1, b: 2}.sub_hash_of?({a: 1, b: 2, c: 3, d: 4}) => true
{a: 1, b: 2}.sub_hash_of?({a: 1, b: 5, c: 3, d: 4}) => false

hash.sub_hash?   # Check if given hash is sub hash of current hash
{a: 1, b: 2, c: 3, d: 4}.sub_hash?({a: 1, b: 2}) => true
{a: 1, b: 2, c: 3, d: 4}.sub_hash?({c: 1, b: 2}) => false
```


### Extensions from ActiveSupport:

#### Objects(String, Array, Hash, Number etc)
```ruby
obj = 'any string' or [array] or {hash} etc

obj.blank?     # ==> true/false
obj.present?   # ==> true/false
```

#### String:
```ruby
str = "something"

str.at:- returns a substring by position, range, regex
str.at(0)      # ==> "s"
str.at(1..3)   # ==> "ome"
str.at(-2)     # ==> "n"
str.at(11)     # ==> nil
str.at("th")   # ==> "th"
str.at("the")  # ==> nil

str.from:- Returns a substring from the given position to the end of the string.
str.from(4)    # ==> "thing"
str.from(-3)   # ==> "ing"

str.to:- Returns a substring from the beginning of the string to the given position.
str.to(0)      # ==> "s"
str.at(3)      # ==> "some"

str.from(2).to(4) # ==> "met"

str.last(n):-  Returns the last n character of the string
str.last(1)     # ==> "g"
str.last(0)     # ==> ""
str.last(3)     # ==> "ing"

str.exclude?:- opposite of str.include?
str.exclude?("thin")  # ==> false
str.exclude?("then")  # ==> true

str = " foo   bar    \n   \t   boo"
str.squish   # => "foo bar boo"
str.squish!

str.remove:- Returns a new string with all occurrences of the patterns removed.
str = "foo bar test"
str.remove(" test")                 # => "foo bar
str.remove!(" test", /bar/)          # => "foo "

str.truncate:- Truncates a given string
str = 'Something is very important in Ruby'
str.truncate(17)  # ==> "Something is very"  # Truncates after a given length
str.truncate(17, separator: ' ')   # pass a separator to truncate at a natural break
str.truncate_words(4)    # "Something is very important"
```

#### Array:
```ruby
arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

arr.extract! { |number| number.odd? }  # ==> [1, 3, 5, 7, 9]

arr.from(position):- Returns the array from given position.
[ a b c d ].from(2)  # ==> ["c", "d"]

arr.to(position):- Returns the beginning of the array up to position.
%w( a b c d ).to(2)  # ==> ["a", "b", "c"]

arr.including(*elements):- Returns a new array by adding passed elements.
[ 1, 2, 3 ].including(4, 5) # => [ 1, 2, 3, 4, 5 ]

arr.excluding(*elements):- Returns a new array by excluding passed elements.
[ 1, 2, 3, 4, 5 ].excluding(4, 5)  # ==> [1, 2, 3]

arr.without(*elements):- alias for excluding

arr.first
arr.second
arr.third
arr.fourth
arr.fifth
...
```

#### Hash:
```ruby
hash = { a: 1, b: 2, c: 3 }

hash.except(*keys):- Returns a hash with keys except given keys.
hash.except(:c)       # ==> { a: 1, b: 2 }
hash.except!(:a, :b)  # ==> { c: 3 }

{ a: 1, b: 2 }.stringify_keys   # ==> { "a" => 1, "b" => 2 }  # Convert keys to Strings  # Returns a new hash
{ a: 1, b: 2 }.stringify_keys!  # ==> { "a" => 1, "b" => 2 }  # Convert keys to Strings  # Change same hash

{ "a" => 1, "b" => 2 }.symbolize_keys   # ==> { a: 1, b: 2 }  # Convert keys to Symbols  # Returns a new hash
{ "a" => 1, "b" => 2 }.symbolize_keys!  # ==> { a: 1, b: 2 }  # Convert keys to Symbols  # Change same hash

hash.assert_valid_keys:- Validates all keys in a hash, string and symbol keys are treated differently
{ a: 1, b: 2 }.assert_valid_keys(:a, :c)  # ==> raises "ArgumentError: Unknown key: :c, Valid keys are: :a, :b
{ a: 1, b: 2 }.assert_valid_keys(:a, :b)  # ==> Passes

# Covert keys of hash with nested hashes and arrays.
hash.deep_stringify_keys
hash.deep_stringify_keys!
hash.deep_symbolize_keys
hash.deep_symbolize_keys!

hash = { a: 1, b: 2, c: 3, d: 4 }
hash.slice(:a, :b)  # ==> {:a=>1, :b=>2}, keeps hash as it is
# hash.extract is same as hash.slice

hash = { a: 1, b: 2, c: 3, d: 4 }
hash.slice!(:a, :b)  # ==> {:c=>3, :d=>4}, change original hash to: {:a=>1, :b=>2}

hash = { a: 1, b: 2, c: 3, d: 4 }
hash.extract!(:a, :b)  # ==> {:a=>1, :b=>2}, change original hash to: {:c=>3, :d=>4}

hash = { a: { key1: 'value1', key2: 'value2' } }
hash.deep_transform_values(&block) # Returns a new hash with all values converted by the block operation.
hash.deep_transform_values{ |value| value.to_s.upcase }  # ==> { a: { key1: 'VALUE1', key2: 'VALUE2' } }

hash.deep_transform_values!(&block) # Change the same hash, values converted by the block operation.
```

# Goal:
We have planned to add more & more extensions for common & frequent operations that we do on Ruby objects. And help people to fasten their development work.

# Credit:

Credits to Rails ActiveSupport - https://github.com/rails/rails/tree/master/activesupport , for its core extentions. Which is the base of this gem.
