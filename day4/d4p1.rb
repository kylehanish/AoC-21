require '../input.rb'
require '../base.rb'
require './classes.rb'

@filename = 'd4-input.txt'
lines = Input.get_file_lines(@filename)

input = lines.shift(2).first # get input and blank line following, choose first line of input
board_states = []
temp = []

lines.each_with_index do |line, index| 
    if line.empty?
        board_state = BoardState.new({game_board: GameBoard.init({board: temp})})
        board_states << BoardState.new({game_board: GameBoard.init({board: temp})})
        temp = []
        next
    end

    temp << line.split(' ').map(&:to_i)
end

input_numbers = input.split(',').map(&:to_i)

valid_solution = nil
last_num = nil
input_numbers.each do |num|
    last_num = num
    board_states.each do |state|
        valid = state.add_and_check_state(num)
        if valid
            valid_solution = state
            break
        end
    end
    break unless valid_solution.nil?
end

puts "complete"
puts valid_solution.unchecked_numbers.reduce(:+) * last_num if valid_solution

