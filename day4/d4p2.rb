require '../input.rb'
require '../base.rb'
require './classes.rb'

@filename = 'd4-input.txt'
lines = Input.get_file_lines(@filename)

input = lines.shift(2).first # get input and blank line following, choose first line of input
board_states = []
temp = []

lines.each_with_index do |line, index| 
    temp << line.split(' ').map(&:to_i) unless line.empty?
    if line.empty? || index == (lines.length - 1)

        board_states << BoardState.new({game_board: GameBoard.init({board: temp})})
        temp = []
        next
    end
end

input_numbers = input.split(',').map(&:to_i)

valid_solutions = []
last_num = nil
last_state = nil
input_numbers.each do |num|
    board_states.each_with_index do |state, index|
        next if state.has_bingo?
        valid = state.add_and_check_state(num)
        if valid && !valid_solutions.include?(state)
            last_num = num
            last_state = index
            valid_solutions << state
        end
    end
end

puts valid_solutions.last.unchecked_numbers.reduce(:+) * last_num if valid_solutions.length.positive?