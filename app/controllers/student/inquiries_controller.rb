class Student::InquiriesController < Student::BaseController
  before_action :should_has_course!, only: [:index]

  def index
    @course = current_user.course

    rated_congressman_ids = current_user.rated_congressman_ids

    # XXX，需求：只顯示沒有評論過的立委的質詢
    rated_congressmen = current_user.rated_congressmen
    not_available_inquiry_ids = rated_congressmen.map(&:inquiry_ids).flatten.uniq

    @inquiries = @course.inquiries.where.not(id: not_available_inquiry_ids)
  end

  private

  def should_has_course!
    redirect_to student_root_path if current_user.course.blank?
  end
end
