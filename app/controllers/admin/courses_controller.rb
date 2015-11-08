class Admin::CoursesController < Admin::BaseController
  before_action :set_course!, only: [:edit, :update]

  def index
    @courses = Course.recent
  end

  def show
  end

  def new
    @course = Course.new
    @students = User.wandering_students
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to admin_courses_path, notice: "課程新增成功"
    else
      render :new
    end
  end

  def edit
    @students = (User.wandering_students + @course.students)
  end

  def update
    if @course.update(course_params)
      redirect_to admin_courses_path, notice: "課程更新成功"
    else
      render :edit
    end
  end

  private

  def set_course!
    @course = Course.find(params[:id])
  end

  def course_params
    params[:course].permit(:name, :evaluation_id, student_ids: [])
  end
end
