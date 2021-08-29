class Public::ReportsController < ApplicationController
  before_action :authenticate_customer!

  def index
   @memos= Memo.where(customer_id: current_customer)
   @reports = Report.where(customer_id: current_customer).page(params[:page]).reverse_order
  end

  def new
  @memos= Memo.where(customer_id: current_customer)
  @report = Report.new
  end

  def create
    customer_id =current_customer.id
    @report = Report.new(report_params)
    @report.customer_id = current_customer.id
    @tag_list = params[:report][:tag_name].split(nil)
    if @report.save!
       @report.save_tag(@tag_list,customer_id)
      flash[:notice] = "レポートを作成しました"
      redirect_to reports_path
    else
      render :new
    end
  end

  def show
    @memos= Memo.where(customer_id: current_customer)
    @report = Report.find(params[:id])
    @report_tags = @report.tags
    @report_comment = ReportComment.new
  end

  def edit
    @memos= Memo.where(customer_id: current_customer)
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to  reports_path
  end

  private
  def report_params
    params.require(:report).permit(:image, :title_r, :introduction_r, :category_id,)
  end





end
