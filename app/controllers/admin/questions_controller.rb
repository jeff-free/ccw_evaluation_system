class Admin::QuestionsController < Admin::BaseController
  before_action :set_evaluation
  def index
    @question_types = @evaluation.question_types.includes(:questions).uniq
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:evaluation_id])
  end
end
