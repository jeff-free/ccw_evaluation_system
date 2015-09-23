class Admin::CommitteesController < Admin::BaseController
  before_action :set_committee, only: [:show, :edit, :update, :destroy]

  # GET /committees
  def index
    @committees = Committee.all
    @committee = Committee.new
  end

  # GET /committees/1
  def show
  end

  # GET /committees/1/edit
  def edit
  end

  # POST /committees
  def create
    @committee = Committee.new(committee_params)

    if @committee.save
      redirect_to [:admin, @committee], notice: '成功新增委員會'
    else
      render :new
    end
  end

  # PATCH/PUT /committees/1
  def update
    if @committee.update(committee_params)
      redirect_to [:admin, @committee], notice: '成功更新委員會'
    else
      render :edit
    end
  end

  # DELETE /committees/1
  def destroy
    @committee.destroy
    redirect_to [:admin, index], notice: '成功刪除委員會'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee
      @committee = Committee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def committee_params
      params.require(:committee).permit(:name, :description)
    end
end
