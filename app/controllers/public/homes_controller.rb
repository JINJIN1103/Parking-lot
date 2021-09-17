class Public::HomesController < ApplicationController
  def top
    @memos= Memo.where(customer_id: current_customer)
  end
end
