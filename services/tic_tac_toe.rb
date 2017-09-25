class TicTacToe
  def solved?
    diagonals = [diagonal(board), diagonal(board.reverse)]
    rows_solved?(board + board.transpose + diagonals)
  end

  def insert(row, col)
    board[row][col] = player
    board
  end

  private

  attr_reader :board, :player

  def initialize(board:, player:)
    @board = board
    @player = player
  end

  def rows_solved?(rows)
    rows.any? { |row| row.uniq.first == player }
  end

  def diagonal(board)
    (0...board.size - 1).map { |i| board[i][i] }
  end
end
