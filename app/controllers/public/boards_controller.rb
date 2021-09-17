class Public::BoardsController < ApplicationController
  def index
    @memos= Memo.where(customer_id: current_customer)
    @tasks= Task.where(customer_id: current_customer)
    @user = current_customer
    @boards= @user.boards.page(params[:page]).reverse_order
    @board =Board.new
  end

  def new
    @memos= Memo.where(customer_id: current_customer)
  end

  def show
    @memos= Memo.where(customer_id: current_customer)
    @board = Board.find(params[:id])
    unless
    @board.customer == current_customer
     redirect_to boards_path
    end

  end

  def edit
    @memos= Memo.where(customer_id: current_customer)
    @board= Board.find(params[:id])
     unless
    @board.customer == current_customer
     redirect_to boards_path
     end
  end

  def create
    @board = Board.new(board_params_create)
    @board.customer_id = current_customer.id
    if @board.save
    redirect_to boards_path
    else
      @memos= Memo.where(customer_id: current_customer)
      @tasks= Task.where(customer_id: current_customer)
      @user = current_customer
      @boards= @user.boards.page(params[:page]).reverse_order
      render :index
    end
  end

  def update
    board = Board.find(params[:id])
    board.update(board_params_update)
    redirect_to  board_path(board.id)
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    redirect_to  boards_path

  end

 private
  def board_params_create
    params.permit(:title,:introduction,:customer_id)
  end

  def board_params_update
    params.require(:board).permit(:title,:introduction,:customer_id)
  end


end
