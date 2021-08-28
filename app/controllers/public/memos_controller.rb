class Public::MemosController < ApplicationController
  
 def create
   memo = Memo.new(memo_params)
   memo.customer_id = current_customer.id
   memo.save
   redirect_to boards_path
 end


  private
  def memo_params
    #.require(:board)をつけるとエラーになるので記載削除
    params.permit(:memo,:customer_id)
  end

  
end
