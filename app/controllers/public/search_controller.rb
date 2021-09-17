class Public::SearchController < ApplicationController

  def search
  	@memos= Memo.where(customer_id: current_customer)
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'task'
			@task = Task.where(customer_id: current_customer)
			@records = @task.search_for(@content, @method)
		else
			@report= Report.where(customer_id: current_customer)
			@records = @report.search_for(@content, @method)
		end
  end

end
