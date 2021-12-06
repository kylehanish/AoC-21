# Overkill
class BoardState < Base
    attr_accessor :game_board, :solution_map
    
    def initialize(args)
        super(args)
        generate_solution_map
    end

    def add_number(i)
        x,y = game_board.number_mapping.dig(i.to_s)
        return unless x && y
        solution_map[x][y] = i
    end

    def add_and_check_state(i)
        add_number(i)
        has_bingo?
    end

    def unchecked_numbers
        game_board.board.flatten - solution_map.flatten
    end

    def has_bingo?
       row_bingo? || column_bingo? || diagonal_bingo? 
    end

    def row_bingo?
        solution_map.any? { |a| a.all? }
    end

    def column_bingo?
        0.upto(game_board.length - 1) do |index| 
            return true if solution_map.map { |a| a[index] }.all?
        end 
        false
    end

    def diagonal_bingo?
        0.upto(game_board.length - 1) do |index|
            return false if solution_map[index].nil?
            return true if index == game_board.length
        end
        false
    end

    def generate_solution_map
        @solution_map = []
        1.upto(game_board.length).each { |i| solution_map << ([nil] * game_board.length) }
    end
end

class GameBoard < Base
    attr_accessor :board
    
    def self.init(args)
        b = GameBoard.new(args)
        return nil unless b.valid?
        b
    end

    def valid?
        return false unless board.kind_of?(Array)
        return false if board.empty? || board.length < 2

        board.length == board.first.length
    end

    def number_mapping
        @number_mapping ||= begin
            map = Hash.new
            ensure_array.each_with_index { |sub_arr, index|  sub_arr.each_with_index { |o,i| map[o.to_s] = [index,i] }}
            map
        end
    end

    def all_numbers
        @all_numbers ||= ensure_array.flatten.compact.uniq
    end
    
    def length 
        @length ||= ensure_array.length
    end

    def ensure_array
        @ensure_array ||= Array(board)
    end
end