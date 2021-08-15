class Public::ListsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end
  
  def create
    list = List.new(list_params)
    list.customer_id = current_customer.id
    list.save!
    redirect_to boards_path
  end
  
  def update
  end
  
  def destroy
  end
  
   private
  def list_params
    #.require(:board)をつけるとエラーになるので記載削除
    params.permit(:title_l,:customer_id,:board_id)
  end
  
end
