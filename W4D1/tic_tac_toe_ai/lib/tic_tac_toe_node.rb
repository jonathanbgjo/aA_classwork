require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  @@computer_mark = :o

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def my_mark
    self.next_mover_mark == :x ? :o : :x
  end

  def losing_node?(evaluator)
    if self.board.over?
      return false if self.board.tied?
      if self.board.winner != evaluator
        return true
      else 
        return false
      end
    end
    
    if self.next_mover_mark != evaluator
      self.children.any? do |node|
        node.losing_node?(evaluator)
      end
    else
      self.children.all? do |node|
        node.losing_node?(evaluator)
      end
    end
  end

  def winning_node?(evaluator)
     if self.board.over?
      return false if self.board.tied?
      if self.board.winner == evaluator
        return true
      else 
        return false
      end
    end
    
    if self.next_mover_mark != evaluator
      self.children.all? do |node|
        node.winning_node?(evaluator)
      end
    else
      self.children.any? do |node|
        node.winning_node?(evaluator)
      end
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    res_arr = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if col.nil?
          new_board = @board.dup
          new_board.rows[i][j] = @next_mover_mark
          current_move = [i, j]
          @next_mover_mark == :x ? (new_sym = :o) : (new_sym = :x)
          res_arr << TicTacToeNode.new(new_board, new_sym, current_move)
        end
      end 
    end

    res_arr
  end
end

# [][o][x]
# [][x][o] all? false
# [][][]

# [][o][x] :o
# [][x][o] ------- any? false
# [x][][o]

# [x][o][x]
# [][x][o] all? true
# [][][o]

# [x][o][x]
# [][x][o]
# [o][][o]

# [x][o][x]
# [o][x][o] any? true
# [][][o]

# [x][o][x] true
# [o][x][o]
# [x][][o]
