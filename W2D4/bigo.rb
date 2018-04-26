
require 'time'

def my_min_phase1(arr)
  min_el = nil
  arr.each do |el1|
    min_el = el1
    arr.each do |el2|
        min_el = el2 if min_el > el2
    end
    min_el = el1 if min_el > el1
  end

  min_el


end

def my_min_phase2(arr)
  min_el = arr.first
  arr.each do |el|
        min_el = el if min_el > el
  end
  min_el
end




def contiguous_subs_phase1(array)
  max_sum = []
  array.each_with_index do |el1,idx1|
    (idx1...array.size).each do |idx2|

      sub_array = array[idx1..idx2]

      max_sum = sub_array if sub_array.sum > max_sum.sum

    end
  end
  max_sum.sum
end


# def contiguous_subs_phase2(array)
#   return array if array.length == 1
#
#   arr_shift = array[1...array.size]
#   arr_pop = array[0...array.size-1]
#   save_arr_shift = contiguous_subs_phase2(arr_shift)
#   save_arr_pop = contiguous_subs_phase2(arr_pop)
#   max_arr = [save_arr_shift, save_arr_pop].reduce(array) {|acc, el| acc.sum > el.sum ? acc : el}
#
#
#
#
#   # if array.sum > save_arr_pop.sum && array.sum > save_arr_shift.sum
#   #   array
#   # elsif save_arr_pop.sum > save_arr_shift.sum
#   #   save_arr_pop
#   # else
#   #   save_arr_shift
#   # end
#
#
# end

def contiguous_subs_phase2(array)
  lcs = 0
  cs = 0

  array.each do |el|

    cs += el
    cs = 0 if cs < 0

    lcs = cs if lcs < cs
  end

  lcs


end


# time = Time.now
# test_arr = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min_phase1(test_arr)
# puts Time.now - time
# time = Time.now
# puts my_min_phase2(test_arr)
# puts Time.now - time
#






time = Time.now
puts contiguous_subs_phase1([5, 3, -7]).to_s
puts Time.now - time

time = Time.now
puts contiguous_subs_phase2([5, 3, -7]).to_s
puts Time.now - time

time = Time.now
puts contiguous_subs_phase1([2, 3, -6, 7, -6, 7,5,4,6,-8,9]).to_s
puts Time.now - time


time = Time.now
puts contiguous_subs_phase2([2, 3, -6, 7, -6, 7,5,4,6,-8,9]).to_s
puts Time.now - time




















#
