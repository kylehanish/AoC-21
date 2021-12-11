require '../input.rb'

@filename = 'd8-input.txt'
lines = Input.get_file_lines(@filename)

results = lines.map {|l| l.split('|').map(&:strip).map {|s| s.split(' ') } }
relevant_data =  results.transpose[1]
number_good_sequences = relevant_data.map { |a| a.select {|o| [2,3,4,7].include?(o.length)}.length }
puts number_good_sequences.sum