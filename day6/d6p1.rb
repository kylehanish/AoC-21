require '../input.rb'

@filename = 'd6-input.txt'
lines = Input.get_file_lines(@filename).first.split(',').map(&:to_i)


# B R U T E     F O R C E 
# gets infinitely worse :(
[80, 256].each do |days|
    days.times do |d| 
        lines.map! do |line| 
            line -= 1
            lines.push(9) if line.negative?
            line = 6 if line.negative?
            
            line
        end
        puts d
    end
    
    puts lines.length
end

\\