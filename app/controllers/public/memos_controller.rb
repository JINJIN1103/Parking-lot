class Public::MemosController < ApplicationController

def index
  @memos= Memo.where(customer_id: current_customer)
  @memo=Memo.new
end

 def create
   @memo = Memo.new(memo_params)
   @memo.customer_id = current_customer.id
   if @memo.save
   redirect_to memos_path
   else
   @memos= Memo.where(customer_id: current_customer)
   render :index
   end
 end

 def destroy
   memo = Memo.find(params[:id])
   memo.destroy
   redirect_to memos_path
 end


  private
  def memo_params
    params.permit(:memo,:customer_id)
  end


end
