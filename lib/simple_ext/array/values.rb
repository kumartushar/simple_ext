# frozen_string_literal: true

class Array

  ##
  # Check if any element is nil in array
  def any_nil?
    any?(&:nil?)
  end

  ##
  # Check if any element is empty in array
  def any_empty?
    any? { |e| e.respond_to?(:empty?) && e.empty? }
  end

  ##
  # Check if any element is blank in array
  def any_blank?
    any?(&:blank?)
  end

  ##
  # Check if array contains a hash with given arg
  # arg: should be an hash
  #
  # arr = [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]
  # arr.include_hash_with?({a: 4}) => true
  # arr.include_hash_with?({a: 4, b: 5}) => true
  # arr.include_hash_with?({a: 4, b: 6}) => false
  def include_hash_with?(arg)
    !find_hash_with(arg).blank?
  end

  ##
  # Check if array contains a string with given substring
  #
  # arr = ['abc', 'def', 'pqr', 'xyz']
  # arr.include_string_with?('pq')  => true
  # arr.include_string_with?('de')  => false
  def include_string_with?(arg)
    any? { |e| e.include?(arg) }
  end

  ##
  # Find a hash from array which matches given arg
  # arg: should be hash
  #
  # arr = [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]
  # arr.find_hash_with({a: 4})  => {a: 4, b: 5, c: 6}
  # arr.find_hash_with({"b" => 2, "c" => 3}) => {a: 1, b: 2, c: 3}
  # arr.find_hash_with({ a: 4, c: 8 }) => nil
  def find_hash_with(arg)
    find { |h| h.stringify_keys.sub_hash?(arg.stringify_keys) }
  end

  ##
  # Select hashes from array, which matches given arg
  # arg: should be hash
  # 
  # arr = [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}, {a: 1, b: 8, c: 9}]
  # arr.select_hash_with({ a: 1 }) => [{a: 1, b: 2, c: 3}, {a: 1, b: 8, c: 9}]
  def select_hash_with(arg)
    select { |h| h.stringify_keys.sub_hash?(arg.stringify_keys) }
  end
end
