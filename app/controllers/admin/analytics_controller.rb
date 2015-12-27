class Admin::AnalyticsController < Admin::BaseController

  before_action :set_evaluation!


  def index
    @congressmen = @evaluation.congressmen.includes(:parties).includes(:surveys)
  end

  def show
    @congressman = @evaluation.congressmen.find(params[:id])
    congressman_analytics = CongressmanAnalyzer.new(@congressman)
    @results_group_by_question_collection = congressman_analytics.analyze_by_question
    @congressman_mean = congressman_analytics.analyze_by_congressman[:mean]
    @congressman_mean = congressman_analytics.analyze_by_congressman[:median]
    @congressman_mean = congressman_analytics.analyze_by_congressman[:standard_deviation]
  end

  private

  def set_evaluation!
    @evaluation = Evaluation.find(params[:evaluation_id])
  end
end
