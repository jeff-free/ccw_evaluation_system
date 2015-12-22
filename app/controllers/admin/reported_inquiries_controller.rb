class Admin::ReportedInquiriesController < Admin::BaseController
  def index
    @inquiries = Inquiry.suspicious
  end

  def deactivate
    @inquiry = Inquiry.find(params[:id])
    @inquiry.deactivate!

    flash[:success] = "已將影片設定為不顯示。"

    redirect_to admin_reported_inquiries_path
  end
end
