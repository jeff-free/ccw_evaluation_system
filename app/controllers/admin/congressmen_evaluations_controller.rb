class Admin::CongressmenEvaluationsController < Admin::BaseController
  before_action :set_congressman, only: [:new, :create]
  before_action :set_congressmen_evaluation, only: [:show, :edit, :update, :destroy, :add_inquiry]
  before_action :set_committee, only: [:show, :edit, :update, :destroy]

  # GET /congressmen_evaluations/1
  def show
    @committee = @congressman.committee_of_evaluation(@evaluation)
    @inquiry = @congressman.inquiries.build
  end

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

  def add_inquiry
    @inquiry = @congressman.inquiries.build(inquiry_params)
    if @inquiry.save
      redirect_to [:admin, @congressmen_evaluation], notice: "成功新增質詢影片"
    else
      render :show
    end
  end

  def remove_inquiry
    @congressmen_evaluation = CongressmenEvaluation.find(params[:congressmen_evaluation_id])
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    redirect_to admin_congressmen_evaluation_path(@congressmen_evaluation), notice: "成功刪除"
  end

  private

    def set_congressman
      @congressman = Congressman.includes(:inquiries, :interpellations).find(params[:congressman_id])
    end

    def set_congressmen_evaluation
      @congressmen_evaluation = CongressmenEvaluation.includes(:congressman, :evaluation).find(params[:id])
      @evaluation = @congressmen_evaluation.evaluation
      @congressman = @congressmen_evaluation.congressman
    end

    def set_committee
      @committee = @congressman.committee_of_evaluation(@evaluation)
    end

    # Only allow a trusted parameter "white list" through.
    def congressmen_evaluation_params
      params.require(:congressmen_evaluation).permit(:evaluation_id, :party_id, :committee_id, :election_type)
    end

    def inquiry_params
      params[:inquiry].permit(:number, :video, :content, :congressman_id, :interpellation_id)
    end
end
