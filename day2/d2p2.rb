require '../input.rb'

@filename = 'd2-input.txt'
lines =  Input.get_file_lines(@filename)

x,y,aim = 0,0,0

lines.each do |line| 
    dir, val = line.split(' ')
    val = val.to_i
    
    case dir
    when "up"
        aim -= val
    when "down"
        aim += val
    when "forward"
        x += val
        y += (val * aim)
    end
end

puts x
puts y 
puts x * y