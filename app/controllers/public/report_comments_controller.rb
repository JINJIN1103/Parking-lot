class Public::ReportCommentsController < ApplicationController

  def create
     @report = Report.find(params[:report_id])
     @report_comment = ReportComment.new(report_comment_params)
     @report_comment.customer_id = current_customer.id
     @report_comment.report_id = @report.id
     @report_comment.save
    redirect_to report_path(@report.id)

  end

  def destroy
    @report = Report.find(params[:report_id])
    @report_comment = ReportComment.new
    ReportComment.find_by(id: params[:id], report_id: params[:report_id]).destroy
    redirect_to report_path(@report.id)
  end

private

  def report_comment_params
    params.require(:report_comment).permit(:comment,:customer_id,:report_id)
  end

end

