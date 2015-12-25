class Volunteer::SurveysController < Volunteer::BaseController

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
      redirect_to root_path, notice: '問卷已經順利提交。'
    else
      :new
    end
  end

  def mark_as_no_value
    @inquiry.mark_as_no_value!

    flash[:success] = "謝謝回報，已通知管理員。"

    redirect_to volunteer_congressmen_path
  end

  private

    def set_evaluation!
      @evaluation = @inquiry.evaluation
    end

    def set_inquiry!
      @inquiry = Inquiry.find(params[:inquiry_id])
    end

    def set_questions
      @questions = @evaluation.questions
    end

    def survey_params
      params[:survey].permit(
        :impression_before_and_after_watching_inquiry,
        :comment_to_the_congressman,
        :whether_to_recommend_the_inquiry,
        :whether_inclusion_of_unappropriate_conversion,
        :suggestion_of_survey,
        :inquiry_id,
        answers_attributes: [:question_id, :point]
      )
    end
end
