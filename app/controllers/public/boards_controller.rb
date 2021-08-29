class Public::BoardsController < ApplicationController
  def index
    @memos= Memo.where(customer_id: current_customer)
    @tasks= Task.where(customer_id: current_customer)
    @user = current_customer
    @boards= @user.boards.page(params[:page]).reverse_order
  end

  def new
    @memos= Memo.where(customer_id: current_customer)
  end

  def show
    @memos= Memo.where(customer_id: current_customer)
    @board = Board.find(params[:id])
  end

  def edit
    @memos= Memo.where(customer_id: current_customer)
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
