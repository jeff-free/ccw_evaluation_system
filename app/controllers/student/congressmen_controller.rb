class Student::CongressmenController < Student::BaseController
  before_action :should_has_course!, only: [:index]

  def index
    @course = Course.find(params[:course_id])

    @congressmen = @course.congressmen
  end

  private

  def should_has_course!
    redirect_to student_root_path if current_user.course.blank?
  end
end
