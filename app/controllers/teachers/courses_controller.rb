class Teachers::CoursesController < Teachers::BaseController
  def index
    @courses = current_user.teached_courses.includes(:interpellations).recent
  end

  def show
    @course = current_user.teached_courses.find(params[:id])
    @students = @course.students.includes(:inquiries)
  end
end
