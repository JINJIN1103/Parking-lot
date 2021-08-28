class Public::ReportsController < ApplicationController
  def index
   @memos= Memo.where(customer_id: current_customer)
   @reports = Report.where(customer_id: current_customer).page(params[:page]).reverse_order
  end

  def new
  @memos= Memo.where(customer_id: current_customer)
  @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.customer_id = current_customer.id
    if @report.save!
      flash[:notice] = "レポートを作成しました"
      redirect_to reports_path
    else
      render :new
    end
  end

  def show
    @memos= Memo.where(customer_id: current_customer)
    @report = Report.find(params[:id])
  end

  def edit
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to  reports_path
  end

  private
  def report_params
    params.require(:report).permit(:image, :title_r, :introduction_r, :category_id, :customer_id)
  end

end
