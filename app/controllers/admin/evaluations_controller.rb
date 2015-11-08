class Admin::EvaluationsController < Admin::BaseController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

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
      redirect_to admin_evaluations_path, notice: "成功新增會期評鑑"
    else
      render :new, alert: "資料錯誤"
    end
  end

  def edit
    @question = @evaluation.questions.build
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to admin_evaluation_path(@evaluation)
    else
      render :new
    end
  end

  def destroy
  end

  private
    def set_evaluation
      @evaluations = Evaluation.all
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params[:evaluation].permit(:session_number, :term_id,
       questions_attributes: [:id, :name, :question_type_id, :_destroy])
    end
end
