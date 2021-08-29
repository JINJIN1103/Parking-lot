class Public::SearchController < ApplicationController

  def search
  	@memos= Memo.where(customer_id: current_customer)
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'task'
			@records = Task.search_for(@content, @method)
		else
			@records = Report.search_for(@content, @method)
		end
  end

end
