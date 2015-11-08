class Citizen::SurveysController < Citizen::BaseController
  before_action :set_event!
  before_action :set_evaluation!
  before_action :find_inquery!, only: [:new, :create]

  def new
    @survey = current_user.surveys.build
    @questions = @evaluation.questions.all
    @answer = Answer.new
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    @survey.evaluation = @evaluation
    @survey.inquery = @inquery

    if @survey.save
      redirect_to thanks_citizen_event_path(@event), notice: '問卷已經順利提交。'
    else
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

  def find_inquery!
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