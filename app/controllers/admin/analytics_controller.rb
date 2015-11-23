class Admin::AnalyticsController < Admin::BaseController

  before_action :set_evaluation!


  def index
    @congressmen = @evaluation.congressmen.includes(:parties).includes(:surveys)
  end

  def show
    @congressman = @evaluation.congressmen.find(params[:id])
    @results_group_by_question_collection = CongressmanAnalyzer.new(@congressman).analyze
  end

  private

  def set_evaluation!
    @evaluation = Evaluation.find(params[:evaluation_id])
  end
end
