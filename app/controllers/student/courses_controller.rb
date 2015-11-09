class Student::CoursesController < Student::BaseController
  before_action :course_should_not_set!, only: [:index]

  def index
    @courses = Course.recent
  end

  private

  def course_should_not_set!
    if current_user.course.present?
      redirect_to student_course_congressmen_path(current_user.course)
    end
  end
end
