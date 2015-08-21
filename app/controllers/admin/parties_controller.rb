class Admin::PartiesController < Admin::BaseController
  before_action :set_admin_party, only: [:show, :edit, :update, :destroy]

  # GET /admin/parties
  def index
    @admin_parties = Admin::Party.all
  end

  # GET /admin/parties/1
  def show
  end

  # GET /admin/parties/new
  def new
    @admin_party = Admin::Party.new
  end

  # GET /admin/parties/1/edit
  def edit
  end

  # POST /admin/parties
  def create
    @admin_party = Admin::Party.new(admin_party_params)

    if @admin_party.save
      redirect_to @admin_party, notice: 'Party was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/parties/1
  def update
    if @admin_party.update(admin_party_params)
      redirect_to @admin_party, notice: 'Party was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/parties/1
  def destroy
    @admin_party.destroy
    redirect_to admin_parties_url, notice: 'Party was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_party
      @admin_party = Admin::Party.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_party_params
      params.require(:admin_party).permit(:name)
    end
end
