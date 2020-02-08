# simple_ext
Ruby objects extensions extracted from rails activesupport core extensions

This gem is extracted from rails activesupport, some basic and common ruby extentions which are used most commonly on objects like array, hash, string etc.

In case you dont need all the functionalities from ActiveSupport, you can use this, else go for ActiveSupport.

# Install

    gem install simple_ext

or 

in Gemfile:

    gem 'simple_ext'

# Usage

To require all the extentions

    require 'simple_ext'

to require specific module

    require 'simple_ext/array'
    require 'simple_ext/string'
    require 'simple_ext/object'
    ...
    
You can use below apis on objects:

#### String:
    str = "something"
    
    str.blank?     # ==> true/false
    str.present?   # ==> true/false
    
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
    

#### Array:
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

# Credit:

All credits to Rails ActiveSupport - https://github.com/rails/rails/tree/master/activesupport 
