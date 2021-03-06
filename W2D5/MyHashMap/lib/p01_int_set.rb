class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)

    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true

  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num > @max || num < 0
    true
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    mod = num % num_buckets
    @store[mod] << num unless include?(num)
  end

  def remove(num)
    mod = num % num_buckets
    @store[mod].delete(num) if include?(num)
  end

  def include?(num)
    mod = num % num_buckets
    @store[mod].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if (count == num_buckets)
      resize!
    end

    mod = num % num_buckets

    unless include?(num)
      @store[mod] << num
      @count += 1
    end

  end

  def remove(num)
    if include?(num)
      mod = num % num_buckets
      @store[mod].delete(num)
      @count-=1
    end
  end

  def include?(num)
    mod = num % num_buckets
    store[mod].include?(num)
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
