require_relative 'polytreenode'

class KnightPathFinder
    attr_reader :set
    BOARD = Array.new(8) {Array.new(8)}
    
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        @set = Set.new()
    end

    def self.valid_moves(pos)
        current_node = PolyTreeNode.new(pos)
        current_x, current_y = pos[0], pos[1]
        arr = []
        moves = [[2,1],[1,2],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
        moves.each do |move|
            arr << [move[0] + current_x, move[1] + current_y]
        end
        arr.reject! { |pos| pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0 }
        arr.map! { |pos| PolyTreeNode.new(pos) }
        arr.each do |ele|
            current_node.children << ele
            ele.parent = current_node
        end
    end

    def new_move_positions(pos)
        remaining_pos = KnightPathFinder.valid_moves(pos).reject { |move| @considered_positions.include?(move) }
        @considered_positions += remaining_pos
        remaining_pos
    end

    def build_move_tree(start, target)

        new_move_positions(start)
        queue = [start]
        queue << new_move_positions(start)
        until queue.empty?
            el = queue.shift
            return el if el.value == target
            el.children.each { |child| queue << child}
        end
        nil
    end

    def trace_path_back
        return = []

        

    end
end