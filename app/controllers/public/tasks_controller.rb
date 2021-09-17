class Public::TasksController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
    @memos= Memo.where(customer_id: current_customer)
    @board =Board.find(params[:board_id])
    @list= List.find(params[:list_id])
    @task= Task.find(params[:id])
    unless
    @task.customer == current_customer
     redirect_to boards_path
    end
  end

  def create
    task = Task.new(task_params_create)
    task.customer_id = current_customer.id
    task.save
    redirect_to board_path(task.board_id)
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params_update)
    redirect_to  board_path(task.board.id)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to  board_path(task.board_id)
  end

  private
  def task_params_create
    params.permit(:title_t,:introduction_t,:start_time,:end_time,:customer_id,:board_id,:list_id)
  end

  def task_params_update
    params.require(:task).permit(:title_t,:introduction_t,:start_time,:end_time,:customer_id,:board_id,:list_id)
  end

end
