class Admin::PartiesController < Admin::BaseController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  # GET /admin/parties
  def index
    @parties = Party.in_current_evaluation
  end

  # GET /admin/parties/1
  def show
    @congressmen = @party.congressmen_evaluations.where(evaluation: @evaluation).map(&:congressman)
  end

  # GET /admin/parties/new
  def new
    @party = Party.new
  end

  # GET /admin/parties/1/edit
  def edit
  end

  # POST /admin/parties
  def create
    @party = Party.new(party_params)

    if @party.save
      redirect_to admin_party_path(@party), notice: '成功建立政黨'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/parties/1
  def update
    if @party.update(party_params)
      redirect_to admin_party_path, notice: '成功更新政黨資料'
    else
      render :edit
    end
  end

  # DELETE /admin/parties/1
  def destroy
    @party.destroy
    redirect_to admin_parties_url, notice: '成功刪除政黨.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.includes(:congressmen).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def party_params
      params.require(:party).permit(:name)
    end
end
