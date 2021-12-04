require '../input.rb'

@filename = 'd3-input.txt'
lines = Input.get_file_lines(@filename)

def find_most_common_bit(arr)
    # group by returns key-value pair
    # find grouping with largest subset
    # grab key
    arr.group_by(&:itself).max_by { |k,v| v.length }.first 
end

def opposite_bit(val)
    (val == 1 ? 0 : 1).to_s
end

def get_all_bits_at_position(arr, index)
    arr.map { |o| o[index] }
end

gamma = ""
epsilon = "" # reverse of gamma bits

puts "char length: #{lines.first.length}"
0.upto(lines.first.length - 1) do |i|
    bit_arr = get_all_bits_at_position(lines, i)
    mcb = find_most_common_bit(bit_arr)
    gamma += mcb
    epsilon += opposite_bit(mcb.to_i)
end


puts "gamma: #{gamma}, #{gamma.to_i(2)}"
puts "epsilon: #{epsilon}, #{epsilon.to_i(2)}"
results = gamma.to_i(2) * epsilon.to_i(2)
puts "results: #{results}"