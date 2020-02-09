
# frozen_string_literal: true

class Hash

  ##
  # Check if current hash is sub hash of given hash
  # {a: 1, b: 2}.sub_hash_of?({a: 1, b: 2, c: 3, d: 4}) => true
  # {a: 1, b: 2}.sub_hash_of?({a: 1, b: 5, c: 3, d: 4}) => false
  def sub_hash_of?(hash)
    hash.merge(self) == hash
  end

  ##
  # Check if given hash is sub hash of current hash
  # {a: 1, b: 2, c: 3, d: 4}.sub_hash?({a: 1, b: 2}) => true
  # {a: 1, b: 2, c: 3, d: 4}.sub_hash?({c: 1, b: 2}) => false
  def sub_hash?(hash)
    merge(hash) == self
  end
end
