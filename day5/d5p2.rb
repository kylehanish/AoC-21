require '../input.rb'

@filename = 'd5-input.txt'
lines = Input.get_file_lines(@filename)
puts "total_lines: #{lines.size}"

# correct answer -->  lines.map {|l| l.scan(/(\d+),(\d+)/).map {|p| p.map(&:to_i)} } 
coordinates = lines.map { |l| l.split( " -> ").map { |s| s.split(',').map(&:to_i) }}
# filter out coordinates that aren't vertical or horizontal lines
filtered_coordinates = coordinates.select { |c| c[0][0] == c[1][0] || c[0][1] == c[1][1] }
points = []
filtered_coordinates.each do |coordinate|
    x1, x2 = coordinate.transpose[0].sort
    (x1..x2).each do |x|
        y1, y2 = coordinate.transpose[1].sort
        (y1..y2).each do |y|
            points.push([x,y])
        end
    end
end

(coordinates - filtered_coordinates).each do |r|
    r = r.transpose
    (0..r[0].reduce(:-).abs).each do |i|
        x1, x2 = r[0]
        y1, y2 = r[1]
        x_new = x1 > x2 ? x1 - i : x1 + i
        y_new = y1 > y2 ? y1 - i : y1 + i
        points.push([x_new, y_new])
    end
end

puts points.group_by { |a| a }.transform_values(&:size).select { |k,v| v > 1}.length