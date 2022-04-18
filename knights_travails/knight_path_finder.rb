require_relative 'polytreenode'

class KnightPathFinder

    BOARD = Array.new(8) {Array.new(8)}
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        build_move_tree
    end

    def self.valid_moves(pos)
        #arr
        current_x, current_y = pos[0], pos[1]
        arr = []
        moves = [[2,1],[1,2],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
        moves.each do |move|
            new_pos = []
            new_pos << move[0] + current_x
            new_pos << move[1] + current_y
            arr << new_pos
        end
        arr.reject { |pos| pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0 }
        arr.map { |pos| KnightPathFinder.new(pos) }
    end

    def new_move_positions(pos)
        remaining_pos = KnightPathFinder.valid_moves(pos).reject { |move| @considered_positions.include?(move) }
        @considered_positions += remaining_pos
    end

    def build_move_tree
        new_move_positions(@root_node)
        queue = [@root_node]
        queue << new_move_positions(@root_node)
        until queue.empty?
            el = queue.shift
            return el if el.value == target
            el.children.each { |child| queue << child}
        end
        nil
    end
end