require '../input.rb'

@filename = 'd7-input.txt'
lines = Input.get_file_lines(@filename).first.split(',').map(&:to_i)

uniq = lines.uniq

p Range.new(lines.min,lines.max).map {|n| lines.map {|n2| (n-n2).abs}.sum}.min