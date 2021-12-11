require '../input.rb'

@filename = 'd7-input.txt'
lines = Input.get_file_lines(@filename).first.split(',').map(&:to_i)

r = Range.new(lines.min, lines.max)
map = r.map do |n|
    lines.map do |n2|
        diff = (n - n2).abs
        factorial = diff * (diff+1)/2
        factorial
    end.sum
end

p map.min