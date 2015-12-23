class Volunteer::SurveysController < Volunteer::BaseController
  before_action :set_inquiry

  def create
    @survey = current_user.surveys.build(survey_params)
    @survey.evaluation = @evaluation
    @survey.inquiry = @inquiry
    @survey.user_role = current_user.role

    if @survey.save
      redirect_to root_path, notice: '問卷已經順利提交。'
    else
      # answers_array = []
      # survey_params[:answers_attributes].each do |answer|
      #   answers_array << Answer.new(answer[1])
      # end
      @questions = @evaluation.questions.all
      render "volunteer/inquiries/show"
    end
  end

  private

    def set_inquiry
      @inquiry = Inquiry.find(params[:inquiry_id])
    end

    def survey_params
      params[:survey].permit(answers_attributes: [:question_id, :point])
    end
end
