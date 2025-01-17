require 'rails_helper'

RSpec.describe Board, type: :model do
  describe '#next_state' do
    it 'calculates the next state for a block' do
      initial_state = [
        [0, 0, 0, 0, 0],
        [0, 1, 1, 0, 0],
        [0, 1, 1, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0]
      ]
      board = Board.create(state: initial_state)

      expect(board.next_state).to eq(initial_state)
    end

    it 'takes the end result to a beehive' do
      initial_state = [
        [0, 0, 0, 0, 0],
        [0, 0, 1, 1, 0],
        [0, 0, 1, 1, 0],
        [0, 0, 1, 1, 0],
        [0, 0, 0, 0, 0]
      ]
      expected_state = [
        [0, 0, 0, 0, 0],
        [0, 0, 1, 1, 0],
        [0, 1, 0, 0, 1],
        [0, 0, 1, 1, 0],
        [0, 0, 0, 0, 0]
      ]
      board = Board.create(state: initial_state)

      expect(board.next_state).to eq(expected_state)
    end

    it 'calculates the next state for a blinker' do
      initial_state = [
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 1, 1, 1, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0]
      ]
      expected_state = [
        [0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0]
      ]
      board = Board.create(state: initial_state)

      expect(board.next_state).to eq(expected_state)
    end
  end
end
