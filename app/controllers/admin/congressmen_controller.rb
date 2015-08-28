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
  end

  def create
    @congressman = @party.congressmen.build(congressman_params)
    @congressman.parties << @party
    if @congressman.save
      redirect_to admin_party_congressmen_path(@party)
    else
      render :new
    end
  end

  private
    def set_party
      @party = Party.find(params[:party_id])
    end

    def set_congressman
      @congressman = Congressman.find(params[:id])
    end

    def congressman_params
      params[:congressman].permit(:name, :en_name, :sex, :degree, :experience, :fax, :tel, :avatar_url)
    end
end
