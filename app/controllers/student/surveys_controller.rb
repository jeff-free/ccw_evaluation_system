class Student::SurveysController < Student::BaseController

  before_action :set_course!
  before_action :set_inquiry!
  before_action :set_evaluation!

  def new
    @survey = current_user.surveys.build
    @questions = @evaluation.questions.all
    @answer = Answer.new
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    @survey.evaluation = @evaluation
    @survey.inquiry = @inquiry

    if @survey.save
      redirect_to thanks_student_courses_path, notice: '問卷已經順利提交。'
    else
      render :new
    end
  end

  private

  def set_course!
    @course = current_user.course
  end

  def set_inquiry!
    @inquiry = @course.inquiries.find(params[:inquiry_id])
  end

  def set_evaluation!
    @evaluation = @inquiry.evaluation
  end

  def survey_params
    params[:survey].permit(answers_attributes: [:question_id, :point])
  end
end
