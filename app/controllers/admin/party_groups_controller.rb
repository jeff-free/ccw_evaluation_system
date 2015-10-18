class Admin::PartyGroupsController < Admin::BaseController
  before_action :set_party_group, only: [:show, :edit, :update, :destroy]

  # GET /party_groups
  def index
    @party_groups = PartyGroup.in_current_evaluation
    @party_group = PartyGroup.new
  end

  # GET /party_groups/1
  def show
  end

  # GET /party_groups/new
  def new
    @party_group = PartyGroup.new
  end

  # GET /party_groups/1/edit
  def edit
  end

  # POST /party_groups
  def create
    @party_group = PartyGroup.new(party_group_params)

    if @party_group.save
      redirect_to [:admin, index], notice: '成功新增政團'
    else
      @party_groups = PartyGroup.all
      render :index
    end
  end

  # PATCH/PUT /party_groups/1
  def update
    if @party_group.update(party_group_params)
      redirect_to [:admin, @party_group], notice: '成功更新政團'
    else
      render :edit
    end
  end

  # DELETE /party_groups/1
  def destroy
    @party_group.destroy
    redirect_to [:admin, index], notice: '成功刪除政團'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party_group
      @party_group = PartyGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def party_group_params
      params.require(:party_group).permit(:name)
    end
end
