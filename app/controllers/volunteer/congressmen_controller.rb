class Volunteer::CongressmenController < Volunteer::BaseController

  def index
    @parties = @evaluation.parties.includes(:congressmen).uniq
  end

  def show
    @congressman = Congressman.find(params[:id])
    @inquiries = @congressman.inquiries
  end

end
