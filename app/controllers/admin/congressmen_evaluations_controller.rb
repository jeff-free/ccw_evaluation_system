class Admin::CongressmenEvaluationsController < Admin::BaseController
  before_action :set_congressman
  before_action :set_congressmen_evaluation, only: [:edit, :update, :destroy]

  # GET /congressmen_evaluations
  # def index
  #   @congressmen_evaluations = CongressmenEvaluation.all
  # end

  # GET /congressmen_evaluations/1
  # def show
  # end

  # GET /congressmen_evaluations/new
  def new
    @congressmen_evaluation = @congressman.congressmen_evaluations.new
  end

  # GET /congressmen_evaluations/1/edit
  def edit
  end

  # POST /congressmen_evaluations
  def create
    @congressmen_evaluation = @congressman.congressmen_evaluations.new(congressmen_evaluation_params)

    if @congressmen_evaluation.save
      redirect_to admin_congressman_path(@congressman), notice: '新增成功'
    else
      render :new
    end
  end

  # PATCH/PUT /congressmen_evaluations/1
  def update
    if @congressmen_evaluation.update(congressmen_evaluation_params)
      redirect_to [:admin, @congressman], notice: '成功更新'
    else
      render :edit
    end
  end

  # DELETE /congressmen_evaluations/1
  def destroy
    @congressmen_evaluation.destroy
    redirect_to [:admin, @congressman], notice: '成功刪除'
  end

  private

    def set_congressman
      @congressman = Congressman.find(params[:congressman_id])
    end

    def set_congressmen_evaluation
      @congressmen_evaluation = CongressmenEvaluation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def congressmen_evaluation_params
      params.require(:congressmen_evaluation).permit(:evaluation_id, :party_id, :party_group_id, :committee_id, :election_type)
    end
end
