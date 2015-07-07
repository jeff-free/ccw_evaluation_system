class Admin::QuestionsController < Admin::BaseController
  before_action :set_legislative_session
  def index
    @question_types = @legislative_session.question_types.includes(:questions).uniq
  end

  private

  def set_legislative_session
    @legislative_session = LegislativeSession.find(params[:legislative_session_id])
  end
end
