class Student::SurveysController < Student::BaseController

  before_action :set_course!
  before_action :set_inquiry!
  before_action :set_evaluation!
  before_action :set_questions

  def new
    @survey = current_user.surveys.build
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    @survey.assign_attributes(evaluation: @evaluation, inquiry: @inquiry, user_role: current_user.role)
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

  def set_questions
    @questions = @evaluation.questions
  end

  def survey_params
    params[:survey].permit(answers_attributes: [:question_id, :point])
  end
end
