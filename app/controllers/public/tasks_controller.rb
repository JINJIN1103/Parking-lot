class Public::TasksController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
    task = Task.new(task_params)
    task.customer_id = current_customer.id
    task.save
    redirect_to boards_path
  end

  def create_m
    task = Task.new(task_params)
    task.board_id = 100
    task.list_id = 100
    task.customer_id = current_customer.id
    task.save!
    redirect_to boards_path
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    #.require(:board)をつけるとエラーになるので記載削除
    params.permit(:title_t,:introduction_t,:start_time,:end_time,:customer_id,:board_id,:list_id)
  end


end
