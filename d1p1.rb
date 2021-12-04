require './input.rb'

@filename = 'd1-input.txt'

lines =  Input.get_file_lines(@filename).compact.map(&:to_i)
result = lines.each_cons(2).select { |a,b| a < b }.length
puts result