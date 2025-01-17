class Board < ApplicationRecord
  # Serialize the column 'state' as an array
  serialize :state, Array

  # Calculate the next state of the board
  def next_state
    return unless state.present? && state[0].present?

    rows = state.size
    cols = state[0].size
    next_board = Array.new(rows) { Array.new(cols, 0) }

    rows.times do |row|
      cols.times do |col|
        live_neighbours = count_live_neighbours(row, col)

        # Apply game rules
        if state[row][col] == 1 && [2, 3].include?(live_neighbours) || state[row][col].zero? && live_neighbours == 3
          next_board[row][col] = 1
        end
      end
    end

    # Update if there is a change
    self.update(state: next_board) unless state == next_board
    next_board
  end

  private

  # Count the number of live neighbours for a given cell
  def count_live_neighbours(cell_row, cell_col)
    live_neighbours = 0

    (cell_row-1..cell_row+1).each do |row|
      (cell_col-1..cell_col+1).each do |col|
        next if row == cell_row && col == cell_col || !row.between?(0, state.size - 1) || !col.between?(0, state[0].size - 1)
        live_neighbours += state[row][col]
      end
    end

    live_neighbours
  end
end
