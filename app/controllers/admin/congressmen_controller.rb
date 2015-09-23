class Admin::CongressmenController < Admin::BaseController
  before_action :set_party, only: [:index, :new, :create]
  before_action :set_congressman, only: [:show, :edit, :update, :destroy]
  def index
    @congressmen = @party.congressmen
  end

  def show
  end

  def new
    @congressman = @party.congressmen.build
    @congressmen_evaluation = @congressman.congressmen_evaluations.build
  end

  def create
    @congressman = @party.congressmen.build(congressman_params)
    if @congressman.save
      redirect_to admin_party_congressmen_path(@party)
    else
      render :new
    end
  end

  def update
    if @congressman.update(congressman_params)
      redirect_to [:admin, @congressman], notice: "成功更新"
    else
      render :show, notice: "更新失敗"
    end
  end

  private
    def set_party
      @party = Party.find(params[:party_id])
    end

    def set_congressman
      @congressman = Congressman.includes(:congressmen_evaluations).find(params[:id])
    end

    def congressman_params
      params[:congressman].permit(:name, :en_name, :sex, :degree, :experience, :fax, :tel, :avatar_url,
        congressmen_evaluations_attributes:[:evaluation_id, :party_id, :committee_id, :election_type])
    end
end
