class Volunteer::InquiriesController < Volunteer::BaseController
  def mark_as_no_value
    @inquiry = Inquiry.find(params[:id])
    @inquiry.mark_as_no_value!

    flash[:success] = "謝謝回報，已通知管理員。"

    redirect_to volunteer_congressmen_path
  end
end
