class Public::BoardsController < ApplicationController
  def index
    @user = current_customer
    @tasks= @user.tasks.page(params[:page]).reverse_order
    @boards= @user.boards.page(params[:page]).reverse_order
  end

  def new
  end

  def show
    @boards = Board.all
    @board = Board.find(params[:id])
  end

  def edit
  end

  def create
    board = Board.new(board_params)
    board.customer_id = current_customer.id
    board.save
    redirect_to boards_path
  end

  def update
  end

  def destroy
  board = Board.find(params[:id])
  board.destroy
  redirect_to  boards_path

  end

 private
  def board_params
    #.require(:board)をつけるとエラーになるので記載削除
    params.permit(:title,:introduction,:customer_id)
  end


end
