class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update]

  # POST /boards
  def create
    board = Board.new(board_params)

    if board.save
      render json: { id: board.id }, status: :created
    else
      render json: { errors: board.errors }, status: :unprocessable_entity
    end
  end

  # GET /boards/:id
  def show
    render json: { state: @board.state }, status: :ok
  end

  # PUT /boards/:id
  def update
    render json: { state: @board.next_state }, status: :ok
  end

  private

  def board_params
    params.require(:board).permit(state: []).tap do |nested_attribute|
      nested_attribute[:state] = params[:board][:state]
    end
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
