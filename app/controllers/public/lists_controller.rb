class Public::ListsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
    @memos= Memo.where(customer_id: current_customer)
    @board =Board.find(params[:board_id])
    @list= List.find(params[:id])
    unless
    @list.customer == current_customer
     redirect_to boards_path
    end
  end

  def create
    list = List.new(list_params_create)
    list.customer_id = current_customer.id
    list.save!
    redirect_to board_path(list.board_id)
  end

  def update
    list = List.find(params[:id])
    list.update(list_params_update)
    redirect_to  board_path(list.board.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to  board_path(list.board_id)
  end

   private
  def list_params_create
    params.permit(:title_l,:customer_id,:board_id)
  end

  def list_params_update
    params.require(:list).permit(:title_l,:customer_id,:board_id)
  end


end
