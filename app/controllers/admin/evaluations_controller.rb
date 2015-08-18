class Admin::EvaluationsController < Admin::BaseController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @evaluations = Evaluation.all
  end

  def show
    
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      respond_with @evaluation, admin_evaluations_path, notice: "成功新增會期評鑑"
    else
      render :new, alert: "資料錯誤"
    end
  end

  def edit
    @question_types = @evaluation.question_types.includes(:questions).uniq
    @question = @evaluation.questions.build
  end

  def update
    if @evaluation.update(evaluation_params)
      respond_with :admin, @evaluation
    else
      render :new
    end
  end

  def destroy
    
  end

  private
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params[:evaluation].permit(:year, :session_number, questions_attributes: [:id, :name, :question_type_id, :_destroy])
    end
end
