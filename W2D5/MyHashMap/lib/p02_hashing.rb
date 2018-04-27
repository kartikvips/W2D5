class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return nil.hash if self == []
    arr = self.map.with_index {|el, i| el.hash + i.hash}
    hsh =  arr.reduce(&:^)
    hsh.hash
  end
end

class String
  def hash
    arr = self.chars
    arr.map! {|el| el.ord}
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end
