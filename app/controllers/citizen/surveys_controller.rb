class Citizen::SurveysController < Citizen::BaseController
  before_action :set_event!
  before_action :set_evaluation!
  before_action :find_inquiry!, only: [:new, :create]
  before_action :set_questions, only: [:new, :create]

  def new
    @survey = current_user.surveys.build
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    @survey.assign_attributes(evaluation: @evaluation, inquiry: @inquiry, user_role: current_user.role)

    if @survey.save
      redirect_to thanks_citizen_event_path(@event), notice: '問卷已經順利提交。'
    else
      flash[:error] = "問卷沒有填寫完整，請重新填寫。"
      render :new
    end
  end

  private

  def set_event!
    @event = Event.find(params[:event_id])
  end

  def set_evaluation!
    @evaluation = @event.evaluation
  end

  def set_questions
    @questions = @evaluation.questions
  end

  def find_inquiry!
    not_valid_inquiry_ids = current_user.inquiry_ids
    @inquiry = @event.inquiries.where.not(id: not_valid_inquiry_ids).first

    if @inquiry.blank?
      flash[:notice] = "你已經完成所有的問卷了，感謝！"
      redirect_to thanks_citizen_event_path(@event)
    end
  end

  def survey_params
    params[:survey].permit(answers_attributes: [:question_id, :point])
  end
end