class Volunteer::SurveysController < Volunteer::BaseController

  def new
    @survey = current_user.surveys.build
    @questions = @evaluation.questions.all
    @answer = Answer.new
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    @survey.evaluation = @evaluation
    @survey.inquiry = @inquiry
    @survey.user_role = current_user.role

    if @survey.save
      redirect_to root_path, notice: '問卷已經順利提交。'
    else
      render :new
    end
  end

  private

    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    

    def survey_params
      params[:survey].permit(answers_attributes: [:question_id, :point])
    end
end