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
        (p1 + 2 && p2 + 1) (p1 + 1 && p2 + 2) && (p1 + 2 && p2 - 1) || (p1 + 1 && p2 - 2)
        || (p1 - 1 && p2 - 2) || (p1 - 2 && p2 - 1) || (p1 - 2 && p2 + 1) || (p1 -1 && p2 + 2)
    end

    def new_move_positions(pos)
        remaining_pos = KnightPathFinder.valid_moves(pos).reject { |move| @considered_positions.include?(move) }
        @considered_positions += remaining_pos
    end

    def build_move_tree
        new_move_positions(@root_node)
        #use polytreenode
    end
end