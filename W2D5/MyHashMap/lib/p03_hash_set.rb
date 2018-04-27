require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count == num_buckets
      resize!
    end

    hash = key.hash
    mod = hash % num_buckets
    unless include?(key)
      @store[mod] << key
      @count += 1
    end


  end

  def include?(key)
    hash = key.hash
    mod = hash % num_buckets
    @store[mod].include?(key)
  end

  def remove(key)
    hash = key.hash
    mod = hash % num_buckets
    if include?(key)
      @store[mod].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    tempvar = @store
    @store = Array.new(count*2) { Array.new }
    @count = 0
    tempvar.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end

  end

end
