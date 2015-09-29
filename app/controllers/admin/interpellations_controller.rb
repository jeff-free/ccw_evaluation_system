class Admin::InterpellationsController < Admin::BaseController
  before_action :set_interpellation, only: [:show, :edit, :update, :destroy]
  before_action :set_committee, only: [:new, :create]

  # GET /interpellations
  def index
    @interpellations = Interpellation.all
  end

  # GET /interpellations/1
  def show
  end

  # GET /interpellations/new
  def new
    @interpellation = @committee.interpellations.build
  end

  # GET /interpellations/1/edit
  def edit
  end

  # POST /interpellations
  def create
    @interpellation = @committee.interpellations.build(interpellation_params)

    if @interpellation.save
      redirect_to [:admin, @committee], notice: '成功新增會議'
    else
      render :new
    end
  end

  # PATCH/PUT /interpellations/1
  def update
    if @interpellation.update(interpellation_params)
      redirect_to [:admin, @interpellation], notice: '成功更新會議'
    else
      render :edit
    end
  end

  # DELETE /interpellations/1
  def destroy
    @interpellation.destroy
    redirect_to admin_committees_path, notice: '成功刪除會議'
  end

  private
    def set_interpellation
      @interpellation = Interpellation.find(params[:id])
    end

    def set_committee
      @committee = Committee.find(params[:committee_id])
    end

    # Only allow a trusted parameter "white list" through.
    def interpellation_params
      params.require(:interpellation).permit(:name, :interpellation_date, :content, :committee_id, :evaluation_id)
    end
end
