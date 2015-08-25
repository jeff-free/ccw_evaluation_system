class Admin::CongressmenController < Admin::BaseController
  before_action :set_party, only: [:index]
  def index
    @congressmen = @party.congressmen
  end

  private
    def set_party
      @party = Party.find(params[:party_id])
    end
end
