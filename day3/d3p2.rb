require '../input.rb'

@filename = 'd3-input.txt'
lines = Input.get_file_lines(@filename)

def find_most_common_bit(arr, tie_breaker = 1)
    # group by returns key-value pair
    # find grouping with largest subset
    # grab key
    # in case of ties, proritize tie breaker value
    arr.group_by(&:itself).max_by { |k,v| [v.length, (k.eql?(tie_breaker.to_s) ? 1000 : -1000)] }.first
end

def find_least_common_bit(arr, tie_breaker = 1)
    arr.group_by(&:itself).min_by { |k,v| [v.length, (k.eql?(tie_breaker.to_s) ? -1000 : 1000)] }.first
end

def get_all_bits_at_position(arr, index)
    arr.map { |o| o[index] }
end

def filter_subgroup(arr, index, meth, tie_breaker = 1)
    expected_value = method(meth).call(get_all_bits_at_position(arr, index), tie_breaker) # yay functional programming
    valid = arr.select { |s| s[index].eql?(expected_value.to_s) }
    
    if valid.length > 1 && index < arr.first.length
        valid = filter_subgroup(valid, index + 1, meth, tie_breaker)
    end

    valid
end



oxy_rating = filter_subgroup(lines, 0, :find_most_common_bit, 1)
co2_rating = filter_subgroup(lines, 0, :find_least_common_bit, 0)

puts oxy_rating
puts co2_rating
puts oxy_rating.first.to_i(2) * co2_rating.first.to_i(2)