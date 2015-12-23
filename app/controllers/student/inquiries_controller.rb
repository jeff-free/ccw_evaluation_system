class Student::InquiriesController < Student::BaseController
  before_action :should_has_course!

  def index
    @course = current_user.course
    
    # XXX，需求：只顯示沒有評論過的立委的質詢
    rated_congressmen = current_user.rated_congressmen
    not_available_inquiry_ids = rated_congressmen.map(&:inquiry_ids).flatten.uniq

    @inquiries = @course.inquiries.where.not(id: not_available_inquiry_ids)
  end

  def mark_as_no_value
    @course = current_user.course
    @inquiry = @course.inquiries.find(params[:id])
    @inquiry.mark_as_no_value!

    flash[:success] = "謝謝回報，已通知管理員。"

    redirect_to student_course_inquiries_path(@course)
  end

  private

  def should_has_course!
    redirect_to student_root_path if current_user.course.blank?
  end
end
