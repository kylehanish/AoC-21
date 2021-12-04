require '../input.rb'

@filename = 'd2-input.txt'
lines =  Input.get_file_lines(@filename)

def parse_line(line)
    line.split(' ')
end

def adjust_coordinates(dir, val)
    val = val.to_i unless val.kind_of?(Integer)
    # note y is depth, which gets more positive (opposite of what you'd think)
    case dir
    when "up"
        [0,-val]
    when "down"
        [0,val]
    when "forward"
        [val, 0]
    end
end

coordinate = [0,0]

lines.each do |line| 
    dir, val = parse_line(line)
    coordinate = coordinate.zip(adjust_coordinates(dir,val)).collect { |a| a.reduce(:+)}
end

puts coordinate
results = coordinate.first * coordinate.last
puts results